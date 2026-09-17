/**
 * Premier College - Site Splash Screen Lifecycle
 * Controls the high-impact splash screen display, minimum viewing time for smooth branding,
 * and graceful exit transitions.
 */
(function () {
  'use strict';

  var MIN_SPLASH_TIME = 750;   // Minimum ms to show branding smoothly
  var MAX_SPLASH_TIME = 3000;  // Safety timeout to prevent screen lock
  var splashStartTime = Date.now();
  var isDismissed = false;
  var hasShownInitialSplash = false;

  function getSplash() {
    return document.getElementById('site-splash');
  }

  function activateSplash() {
    var splash = getSplash();
    if (!splash) return;
    isDismissed = false;
    splashStartTime = Date.now();
    splash.classList.remove('is-hidden');
    splash.removeAttribute('aria-hidden');
    splash.style.display = 'flex';
    document.documentElement.classList.add('is-splash-active');
  }

  function dismissSplash() {
    if (isDismissed) return;
    var splash = getSplash();
    if (!splash) return;

    var elapsed = Date.now() - splashStartTime;
    var remaining = Math.max(0, MIN_SPLASH_TIME - elapsed);

    window.setTimeout(function () {
      isDismissed = true;
      hasShownInitialSplash = true;
      splash.classList.add('is-hidden');
      document.documentElement.classList.remove('is-splash-active');

      // Fully hide and mark aria-hidden after CSS transition completes
      window.setTimeout(function () {
        if (isDismissed) {
          splash.setAttribute('aria-hidden', 'true');
          splash.style.display = 'none';
        }
      }, 600);
    }, remaining);
  }

  // Safety fallback so the user is never stuck
  window.setTimeout(function () {
    if (!isDismissed) {
      dismissSplash();
    }
  }, MAX_SPLASH_TIME);

  // Initial load handling
  if (document.readyState === 'complete') {
    dismissSplash();
  } else {
    window.addEventListener('load', dismissSplash);
    document.addEventListener('DOMContentLoaded', function () {
      // If images are already cached, dismiss after min time
      window.setTimeout(dismissSplash, MIN_SPLASH_TIME);
    });
  }

  // Turbolinks Integration
  document.addEventListener('turbolinks:load', function () {
    // If this is the very first visit/reload, show and dismiss cleanly.
    // Subsequent in-app Turbolinks page transitions remain snappy.
    if (!hasShownInitialSplash) {
      dismissSplash();
    } else {
      var splash = getSplash();
      if (splash) {
        splash.classList.add('is-hidden');
        splash.setAttribute('aria-hidden', 'true');
        splash.style.display = 'none';
        document.documentElement.classList.remove('is-splash-active');
      }
    }
  });

  document.addEventListener('turbolinks:before-cache', function () {
    var splash = getSplash();
    if (splash) {
      splash.classList.add('is-hidden');
      splash.setAttribute('aria-hidden', 'true');
      splash.style.display = 'none';
    }
    document.documentElement.classList.remove('is-splash-active');
  });
})();
