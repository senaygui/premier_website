/**
 * Premier College - Event Gallery Interactive Engine
 * Category Filtering & Accessible High-Performance Lightbox Modal
 */

(function () {
  'use strict';

  var galleryData = [];
  var currentIndex = 0;
  var modalEl = null;
  var modalImg = null;
  var modalTitle = null;
  var modalCaption = null;
  var modalCategory = null;
  var modalDate = null;
  var modalCounter = null;
  var previousActiveElement = null;

  function initGallery() {
    var dataEl = document.getElementById('gallery-items-data');
    if (!dataEl) return;

    try {
      galleryData = JSON.parse(dataEl.textContent);
    } catch (e) {
      console.warn('Unable to parse gallery data:', e);
      galleryData = [];
    }

    modalEl = document.getElementById('gallery-lightbox-modal');
    if (modalEl && modalEl.parentNode !== document.body) {
      document.body.appendChild(modalEl);
    }
    modalImg = document.getElementById('gallery-modal-img');
    modalTitle = document.getElementById('gallery-modal-title');
    modalCaption = document.getElementById('gallery-modal-caption');
    modalCategory = document.getElementById('gallery-modal-category');
    modalDate = document.getElementById('gallery-modal-date');
    modalCounter = document.getElementById('gallery-modal-counter');

    setupFiltering();
    setupLightboxTriggers();
    setupLightboxNavigation();
  }

  function setupFiltering() {
    var filterButtons = document.querySelectorAll('.gallery-filter-btn');
    var cards = document.querySelectorAll('.gallery-card-col');

    filterButtons.forEach(function (btn) {
      btn.addEventListener('click', function () {
        filterButtons.forEach(function (b) {
          b.classList.remove('active');
          b.setAttribute('aria-selected', 'false');
        });
        btn.classList.add('active');
        btn.setAttribute('aria-selected', 'true');

        var filter = btn.getAttribute('data-filter');

        cards.forEach(function (card) {
          var cardCategory = card.getAttribute('data-category');
          if (filter === 'all' || cardCategory === filter) {
            card.classList.remove('is-filtered-out');
            card.style.opacity = '0';
            card.style.transform = 'translateY(16px)';
            window.requestAnimationFrame(function () {
              card.style.transition = 'opacity 0.4s ease, transform 0.4s ease';
              card.style.opacity = '1';
              card.style.transform = 'translateY(0)';
            });
          } else {
            card.classList.add('is-filtered-out');
          }
        });
      });
    });
  }

  function setupLightboxTriggers() {
    var triggers = document.querySelectorAll('[data-gallery-trigger]');
    triggers.forEach(function (trigger) {
      trigger.addEventListener('click', function (e) {
        e.preventDefault();
        var index = parseInt(trigger.getAttribute('data-gallery-trigger'), 10);
        openModal(index);
      });
      trigger.addEventListener('keydown', function (e) {
        if (e.key === 'Enter' || e.key === ' ') {
          e.preventDefault();
          var index = parseInt(trigger.getAttribute('data-gallery-trigger'), 10);
          openModal(index);
        }
      });
    });
  }

  function openModal(index) {
    if (!modalEl || !galleryData[index]) return;
    if (modalEl.parentNode !== document.body) {
      document.body.appendChild(modalEl);
    }
    previousActiveElement = document.activeElement;
    currentIndex = index;
    updateModalContent();

    modalEl.classList.add('is-open');
    modalEl.setAttribute('aria-hidden', 'false');
    document.body.classList.add('gallery-modal-locked');

    var closeBtn = modalEl.querySelector('.gallery-modal-close');
    if (closeBtn) {
      setTimeout(function () { closeBtn.focus(); }, 50);
    }

    document.addEventListener('keydown', handleKeydown);
  }

  function closeModal() {
    if (!modalEl) return;
    modalEl.classList.remove('is-open');
    modalEl.setAttribute('aria-hidden', 'true');
    document.body.classList.remove('gallery-modal-locked');

    document.removeEventListener('keydown', handleKeydown);

    if (previousActiveElement && typeof previousActiveElement.focus === 'function') {
      previousActiveElement.focus();
    }
  }

  function showNext() {
    if (!galleryData.length) return;
    currentIndex = (currentIndex + 1) % galleryData.length;
    updateModalContent();
  }

  function showPrev() {
    if (!galleryData.length) return;
    currentIndex = (currentIndex - 1 + galleryData.length) % galleryData.length;
    updateModalContent();
  }

  function updateModalContent() {
    var item = galleryData[currentIndex];
    if (!item) return;

    if (modalImg) {
      modalImg.style.opacity = '0.3';
      var targetSrc = item.url;
      var tile = document.querySelector('[data-gallery-trigger="' + currentIndex + '"]');
      if (tile) {
        var tileImg = tile.querySelector('.gallery-tile-img');
        if (tileImg && tileImg.currentSrc) {
          targetSrc = tileImg.currentSrc;
        } else if (tileImg && tileImg.src) {
          targetSrc = tileImg.src;
        }
      }
      modalImg.src = targetSrc;
      modalImg.alt = item.title;
      modalImg.onload = function () {
        modalImg.style.opacity = '1';
      };
    }
    if (modalTitle) modalTitle.textContent = item.title;
    if (modalCaption) {
      modalCaption.textContent = item.caption;
      modalCaption.style.display = item.caption ? 'block' : 'none';
    }
    if (modalCategory) modalCategory.textContent = (item.category || 'MOMENT').toUpperCase();
    if (modalDate) modalDate.textContent = item.date;
    if (modalCounter) modalCounter.textContent = (currentIndex + 1) + ' of ' + galleryData.length;
  }

  function handleKeydown(e) {
    if (e.key === 'Escape') {
      closeModal();
    } else if (e.key === 'ArrowRight') {
      showNext();
    } else if (e.key === 'ArrowLeft') {
      showPrev();
    }
  }

  function setupLightboxNavigation() {
    if (!modalEl) return;

    var closeButtons = modalEl.querySelectorAll('[data-modal-close]');
    closeButtons.forEach(function (btn) {
      btn.addEventListener('click', closeModal);
    });

    var nextBtn = modalEl.querySelector('[data-modal-next]');
    if (nextBtn) {
      nextBtn.addEventListener('click', function (e) {
        e.stopPropagation();
        showNext();
      });
    }

    var prevBtn = modalEl.querySelector('[data-modal-prev]');
    if (prevBtn) {
      prevBtn.addEventListener('click', function (e) {
        e.stopPropagation();
        showPrev();
      });
    }
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initGallery);
  } else {
    initGallery();
  }

  document.addEventListener('turbolinks:load', initGallery);

  window.EventGalleryEngine = {
    init: initGallery,
    open: openModal,
    close: closeModal
  };
})();
