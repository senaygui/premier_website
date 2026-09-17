(function () {
  'use strict';

  var AUTOPLAY_DELAY = 2500; // 4.5 seconds per slide
  var MIN_LOADER_TIME = 400; // brief display of loader for smooth rendering

  function setupCarousel(carousel) {
    if (carousel.dataset.initialized === 'true') return;

    var slides = Array.prototype.slice.call(carousel.querySelectorAll('[data-hero-slide]'));
    var prevBtn = carousel.querySelector('[data-hero-previous]');
    var nextBtn = carousel.querySelector('[data-hero-next]');
    var dots = Array.prototype.slice.call(carousel.querySelectorAll('[data-hero-index]'));
    var status = carousel.querySelector('[data-hero-status]');
    var loader = carousel.querySelector('[data-carousel-loader]');

    carousel.dataset.initialized = 'true';
    carousel.classList.add('is-loading-carousel');

    var currentIndex = 0;
    var timer = null;
    var isAnimating = false;
    var carouselRevealed = false;
    var pauseTimeout = null;

    function updateDotProgress(activeIndex) {
      dots.forEach(function (dot, i) {
        var isActive = i === activeIndex;
        dot.classList.toggle('active', isActive);
        dot.setAttribute('aria-current', String(isActive));
        var bar = dot.querySelector('.dot-bar');
        if (bar) {
          bar.style.transition = 'none';
          bar.style.width = '0%';
          if (isActive) {
            // Trigger reflow to restart CSS transition
            void bar.offsetWidth;
            bar.style.transition = 'width ' + (AUTOPLAY_DELAY / 1000) + 's linear';
            bar.style.width = '100%';
          }
        }
      });
    }

    function startTimer() {
      stopTimer();
      if (slides.length >= 2) {
        timer = window.setInterval(function () {
          next();
        }, AUTOPLAY_DELAY);
      }
    }

    function stopTimer() {
      if (timer) {
        window.clearInterval(timer);
        timer = null;
      }
    }

    // Temporary pause when user interacts with controls
    function temporaryPause(ms) {
      stopTimer();
      if (pauseTimeout) {
        window.clearTimeout(pauseTimeout);
      }
      pauseTimeout = window.setTimeout(function () {
        startTimer();
      }, ms || 5000);
    }

    // Reveal carousel by dismissing the loader overlay
    function revealCarousel() {
      if (carouselRevealed) return;
      carouselRevealed = true;

      if (loader) {
        loader.classList.add('is-hidden');
        window.setTimeout(function () {
          loader.style.display = 'none';
        }, 400);
      }

      carousel.classList.remove('is-loading-carousel');
      carousel.classList.add('is-carousel-ready');

      // Ensure first slide is active
      if (slides.length > 0) {
        slides.forEach(function (slide, idx) {
          slide.hidden = idx !== 0;
          slide.classList.toggle('active', idx === 0);
        });
        updateDotProgress(0);
        var bgItems = carousel.querySelectorAll('[data-bg-index]');
        bgItems.forEach(function (bg, idx) {
          bg.classList.toggle('active', idx === 0);
        });
      }

      // Begin autoplay immediately
      if (slides.length >= 2) {
        startTimer();
      }
    }

    // Wait briefly for primary images or reveal quickly
    var primaryImages = slides.length > 0
      ? Array.prototype.slice.call(slides[0].querySelectorAll('img'))
      : [];
    var pendingImages = primaryImages.filter(function (img) { return !img.complete; });

    if (pendingImages.length === 0) {
      window.setTimeout(revealCarousel, MIN_LOADER_TIME);
    } else {
      var loadedCount = 0;
      function onImageComplete() {
        loadedCount += 1;
        if (loadedCount >= pendingImages.length) {
          revealCarousel();
        }
      }
      pendingImages.forEach(function (img) {
        img.addEventListener('load', onImageComplete);
        img.addEventListener('error', onImageComplete);
      });
      // Safety timeout: reveal within 1.2s
      window.setTimeout(revealCarousel, 1200);
    }

    if (slides.length < 2) {
      carousel._carouselCleanup = function () {
        delete carousel.dataset.initialized;
      };
      return;
    }

    function goToSlide(newIndex, direction) {
      if (isAnimating) return;
      var target = (newIndex + slides.length) % slides.length;
      if (target === currentIndex) return;

      isAnimating = true;

      var prevIndex = currentIndex;
      currentIndex = target;

      var currentSlide = slides[prevIndex];
      var nextSlide = slides[currentIndex];

      // Prepare next slide
      nextSlide.hidden = false;
      nextSlide.classList.remove('slide-prev', 'slide-next');
      if (direction) {
        nextSlide.classList.add(direction === 'next' ? 'slide-from-right' : 'slide-from-left');
      }

      // Force reflow
      void nextSlide.offsetWidth;

      // Animate transition
      currentSlide.classList.remove('active', 'slide-from-right', 'slide-from-left');
      currentSlide.classList.add(direction === 'next' ? 'slide-to-left' : 'slide-to-right');

      nextSlide.classList.add('active');
      nextSlide.classList.remove('slide-from-right', 'slide-from-left');

      // Update dots & progress animation
      updateDotProgress(currentIndex);

      // Update full-section background image layer
      var bgItems = carousel.querySelectorAll('[data-bg-index]');
      bgItems.forEach(function (bg, idx) {
        bg.classList.toggle('active', idx === currentIndex);
      });

      if (status) {
        status.textContent = 'Slide ' + (currentIndex + 1) + ' of ' + slides.length;
      }

      window.setTimeout(function () {
        currentSlide.hidden = true;
        currentSlide.classList.remove('slide-to-left', 'slide-to-right');
        isAnimating = false;
      }, 450);
    }

    function next() {
      goToSlide(currentIndex + 1, 'next');
    }

    function prev() {
      goToSlide(currentIndex - 1, 'prev');
    }

    // Attach button click events
    if (prevBtn) {
      prevBtn.addEventListener('click', function (e) {
        e.preventDefault();
        prev();
        temporaryPause(6000);
      });
    }

    if (nextBtn) {
      nextBtn.addEventListener('click', function (e) {
        e.preventDefault();
        next();
        temporaryPause(6000);
      });
    }

    dots.forEach(function (dot) {
      dot.addEventListener('click', function (e) {
        e.preventDefault();
        var targetIndex = parseInt(dot.getAttribute('data-hero-index'), 10);
        if (!isNaN(targetIndex)) {
          var dir = targetIndex > currentIndex ? 'next' : 'prev';
          goToSlide(targetIndex, dir);
          temporaryPause(6000);
        }
      });
    });

    // Keyboard navigation
    carousel.addEventListener('keydown', function (e) {
      if (e.key === 'ArrowLeft') {
        e.preventDefault();
        prev();
        temporaryPause(6000);
      } else if (e.key === 'ArrowRight') {
        e.preventDefault();
        next();
        temporaryPause(6000);
      }
    });

    // Touch swipe support
    var touchStartX = 0;
    var touchStartY = 0;

    carousel.addEventListener('touchstart', function (e) {
      if (e.touches && e.touches.length === 1) {
        touchStartX = e.touches[0].clientX;
        touchStartY = e.touches[0].clientY;
        stopTimer();
      }
    }, { passive: true });

    carousel.addEventListener('touchend', function (e) {
      if (e.changedTouches && e.changedTouches.length === 1) {
        var touchEndX = e.changedTouches[0].clientX;
        var touchEndY = e.changedTouches[0].clientY;
        var diffX = touchStartX - touchEndX;
        var diffY = touchStartY - touchEndY;

        if (Math.abs(diffX) > 45 && Math.abs(diffX) > Math.abs(diffY)) {
          if (diffX > 0) {
            next();
          } else {
            prev();
          }
        }
        temporaryPause(5000);
      }
    }, { passive: true });

    // Store cleanup for Turbolinks
    carousel._carouselCleanup = function () {
      stopTimer();
      if (pauseTimeout) window.clearTimeout(pauseTimeout);
      delete carousel.dataset.initialized;
      if (loader) {
        loader.classList.remove('is-hidden');
        loader.style.display = 'flex';
      }
      carousel.classList.remove('is-carousel-ready');
      carousel.classList.add('is-loading-carousel');
      slides.forEach(function (slide, idx) {
        slide.hidden = idx !== 0;
        slide.classList.toggle('active', idx === 0);
        slide.classList.remove('slide-to-left', 'slide-to-right', 'slide-from-left', 'slide-from-right');
      });
      dots.forEach(function (dot, idx) {
        dot.classList.toggle('active', idx === 0);
        dot.setAttribute('aria-current', String(idx === 0));
        var bar = dot.querySelector('.dot-bar');
        if (bar) {
          bar.style.width = '0%';
          bar.style.transition = 'none';
        }
      });
    };
  }

  function initAll() {
    document.querySelectorAll('[data-home-carousel]').forEach(setupCarousel);
  }

  function destroyAll() {
    document.querySelectorAll('[data-home-carousel]').forEach(function (carousel) {
      if (typeof carousel._carouselCleanup === 'function') {
        carousel._carouselCleanup();
      }
    });
  }

  document.addEventListener('DOMContentLoaded', initAll);
  document.addEventListener('turbolinks:load', initAll);
  document.addEventListener('turbolinks:before-cache', destroyAll);
})();
