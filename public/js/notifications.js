(function () {
  // Shared notifications UI
  function initNotifications() {
    const notificationBtn = document.getElementById("notification-btn");
    const notificationsPanel = document.getElementById("notifications-panel");
    const notificationsBadge = document.getElementById("notification-badge");
    const notificationsList = document.getElementById("notifications-list");
    if (
      !notificationBtn ||
      !notificationsPanel ||
      !notificationsBadge ||
      !notificationsList
    )
      return;

    let allNotifications = JSON.parse(
      localStorage.getItem("sana_notifications") || "[]"
    );

    function save() {
      localStorage.setItem(
        "sana_notifications",
        JSON.stringify(allNotifications)
      );
    }

    function updateBadge() {
      const unread = allNotifications.filter((n) => !n.read).length;
      if (unread > 0) {
        notificationsBadge.textContent = unread;
        notificationsBadge.classList.remove("hidden");
      } else {
        notificationsBadge.classList.add("hidden");
      }
    }

    function renderNotifications() {
      if (!notificationsList) return;
      if (!allNotifications.length) {
        notificationsList.innerHTML =
          '<p class="text-sm text-text-secondary-light dark:text-text-secondary-dark text-center py-8">No notifications</p>';
        return;
      }
      notificationsList.innerHTML = "";
      allNotifications
        .slice()
        .reverse()
        .forEach((n) => {
          const el = document.createElement("div");
          el.className =
            "p-3 rounded-lg border " +
            (n.read
              ? "bg-background-light dark:bg-background-dark border-border-light dark:border-border-dark"
              : "bg-primary/10 border-primary");
          el.tabIndex = 0;
          el.innerHTML = `<div class="flex items-start justify-between"><div class="flex-1"><p class="font-semibold text-text-primary-light dark:text-text-primary-dark">${escapeHtml(
            n.title
          )}</p><p class="text-sm text-text-secondary-light dark:text-text-secondary-dark mt-1">${escapeHtml(
            n.message
          )}</p><p class="text-xs text-text-secondary-light dark:text-text-secondary-dark mt-2">${new Date(
            n.timestamp
          ).toLocaleString()}</p></div><button class="ml-2 text-text-secondary-light dark:text-text-secondary-dark dismiss-btn" data-id="${
            n.id
          }"><span class="material-symbols-outlined">close</span></button></div>`;
          el.addEventListener("click", () => {
            n.read = true;
            save();
            renderNotifications();
            updateBadge();
          });
          notificationsList.appendChild(el);
        });
      notificationsList.querySelectorAll(".dismiss-btn").forEach((btn) => {
        btn.addEventListener("click", (e) => {
          e.stopPropagation();
          const id = Number(btn.dataset.id);
          allNotifications = allNotifications.filter((x) => x.id !== id);
          save();
          renderNotifications();
          updateBadge();
        });
      });
    }

    notificationBtn.addEventListener("click", (e) => {
      e.stopPropagation();
      notificationsPanel.classList.toggle("hidden");
    });

    document.addEventListener("click", (e) => {
      if (!notificationBtn || !notificationsPanel) return;
      if (
        !notificationBtn.contains(e.target) &&
        !notificationsPanel.contains(e.target)
      ) {
        notificationsPanel.classList.add("hidden");
      }
    });

    // expose helper to add notification programmatically
    window.sanaAddNotification = function (title, message) {
      const n = {
        id: Date.now(),
        title: String(title || "Notification"),
        message: String(message || ""),
        timestamp: new Date().toISOString(),
        read: false,
      };
      allNotifications.push(n);
      save();
      renderNotifications();
      updateBadge();
      return n.id;
    };

    function escapeHtml(s) {
      if (!s) return "";
      return String(s).replace(/[&<>"]/g, function (c) {
        return { "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c];
      });
    }

    renderNotifications();
    updateBadge();
  }

  if (document.readyState === "loading")
    document.addEventListener("DOMContentLoaded", initNotifications);
  else initNotifications();
})();
