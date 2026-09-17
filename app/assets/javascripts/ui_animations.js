/**
 * Premier College UI Animations & Scroll Reveal Engine
 * High-performance, Accessible, Native IntersectionObserver Animation Engine
 */

(function () {
  'use strict';

  var observer = null;

  function prefersReducedMotion() {
    return window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  }

  function initUIAnimations() {
    // If user prefers reduced motion, leave elements default visible
    if (prefersReducedMotion()) {
      var allAnimElements = document.querySelectorAll('[data-animate]');
      allAnimElements.forEach(function (el) {
        el.classList.add('is-revealed');
      });
      return;
    }

    // Check IntersectionObserver support
    if (!('IntersectionObserver' in window)) {
      return; // Elements remain 100% visible
    }

    // Disconnect previous observer
    if (observer) {
      observer.disconnect();
    }

    // Mark document as ready for animations
    document.documentElement.classList.add('js-reveal-active');

    // Setup automated staggering for containers with data-animate-stagger
    var staggerContainers = document.querySelectorAll('[data-animate-stagger="true"]');
    staggerContainers.forEach(function (container) {
      var children = container.querySelectorAll('[data-animate]');
      children.forEach(function (child, idx) {
        if (!child.hasAttribute('data-animate-delay')) {
          var delayMs = Math.min((idx + 1) * 100, 500);
          child.setAttribute('data-animate-delay', delayMs);
        }
      });
    });

    // Observer options
    var observerOptions = {
      root: null,
      rootMargin: '0px 0px -40px 0px',
      threshold: 0.08
    };

    observer = new IntersectionObserver(function (entries, currentObserver) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-revealed');
          currentObserver.unobserve(entry.target);
        }
      });
    }, observerOptions);

    var targets = document.querySelectorAll('[data-animate]');
    targets.forEach(function (target) {
      // If element is already in the viewport upon load, reveal immediately
      var rect = target.getBoundingClientRect();
      if (rect.top < window.innerHeight && rect.bottom > 0) {
        target.classList.add('is-revealed');
      } else {
        observer.observe(target);
      }
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initUIAnimations);
  } else {
    initUIAnimations();
  }

  document.addEventListener('turbolinks:load', initUIAnimations);

  window.UIAnimations = {
    init: initUIAnimations,
    refresh: initUIAnimations
  };
})();
