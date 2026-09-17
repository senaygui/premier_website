// Ethiopian New Year (Enkutatash) Adey Abeba Fireworks & Celebration
// Automatically activates every year from September 01 to September 28.
(function () {
  'use strict';

  function isSeasonActive() {
    // Check URL override for preview: ?new_year=true or window flag
    if (window.FORCE_ETHIOPIAN_NEW_YEAR) return true;
    try {
      var urlParams = new URLSearchParams(window.location.search);
      if (urlParams.get('new_year') === 'true') return true;
    } catch (e) {}

    var now = new Date();
    var month = now.getMonth(); // 8 = September (0-indexed)
    var day = now.getDate();
    return month === 8 && day >= 1 && day <= 28;
  }

  function initCelebration() {
    var homeElement = document.querySelector('[data-ethiopian-new-year]');
    if (!homeElement) return; // Only on homepage
    if (!isSeasonActive()) return;

    if (document.getElementById('adey-abeba-canvas')) return; // already active

    // 1. Create Canvas
    var canvas = document.createElement('canvas');
    canvas.id = 'adey-abeba-canvas';
    canvas.className = 'adey-abeba-canvas';
    document.body.appendChild(canvas);

    var ctx = canvas.getContext('2d');
    var width = (canvas.width = window.innerWidth);
    var height = (canvas.height = window.innerHeight);

    function onResize() {
      width = canvas.width = window.innerWidth;
      height = canvas.height = window.innerHeight;
    }
    window.addEventListener('resize', onResize);

    // 2. Create Floating Festive Greeting Banner (unless dismissed in this tab)
    var banner = null;
    function createBanner() {
      if (document.querySelector('.adey-abeba-banner')) return;
      banner = document.createElement('div');
      banner.className = 'adey-abeba-banner animate__animated animate__fadeInDown';
      banner.setAttribute('role', 'status');
      banner.setAttribute('aria-label', 'Ethiopian New Year Celebration');
      banner.innerHTML = [
        '<div class="adey-abeba-banner__content">',
        '  <span class="adey-flower-icon" aria-hidden="true">&#x1F33C;</span>',
        '  <div class="adey-abeba-banner__text">',
        '    <span class="amharic-greeting">መልካም አዲስ ዓመት!</span>',
        '    <span class="english-greeting">Happy Ethiopian New Year from Premier College!</span>',
        '  </div>',
        '  <button type="button" class="adey-abeba-banner__close" aria-label="Dismiss greeting">&times;</button>',
        '</div>'
      ].join('');
      document.body.appendChild(banner);

      var closeBtn = banner.querySelector('.adey-abeba-banner__close');
      closeBtn.addEventListener('click', function (e) {
        e.stopPropagation();
        banner.classList.remove('animate__fadeInDown');
        banner.classList.add('animate__fadeOutUp');
        sessionStorage.setItem('dismiss_ethiopian_new_year', 'true');
        window.setTimeout(function () {
          if (banner && banner.parentNode) banner.parentNode.removeChild(banner);
          banner = null;
        }, 500);
      });
    }

    if (sessionStorage.getItem('dismiss_ethiopian_new_year') !== 'true') {
      createBanner();
    }

    // Allow re-opening from festive badges
    window.toggleEthiopianNewYearBanner = function () {
      if (banner && banner.parentNode) {
        banner.classList.remove('animate__fadeInDown');
        banner.classList.add('animate__fadeOutUp');
        window.setTimeout(function () {
          if (banner && banner.parentNode) banner.parentNode.removeChild(banner);
          banner = null;
        }, 500);
      } else {
        sessionStorage.removeItem('dismiss_ethiopian_new_year');
        createBanner();
      }
    };

    // 3. Adey Abeba Particles and Flower Firework System
    var rockets = [];
    var flowers = [];
    var driftingPetals = [];
    var animFrame = null;
    var isRunning = true;
    var lastLaunch = 0;

    var COLORS = [
      '#FFD700', // Gold
      '#FFEB3B', // Sunny Adey Abeba Yellow
      '#FFF176', // Light Petal Yellow
      '#FFA000', // Amber Petal Edge
      '#FFC107', // Core Yellow
      '#FF8F00'  // Flower Center Orange
    ];

    // Flower Blossom Firework Particle
    function FlowerBlossom(x, y, petalCount, scale) {
      this.x = x;
      this.y = y;
      this.petalCount = petalCount || 8; // Iconic 8 petals of Adey Abeba
      this.scale = scale || 1;
      this.radius = 0;
      this.targetRadius = (45 + Math.random() * 35) * this.scale;
      this.angle = Math.random() * Math.PI * 2;
      this.rotationSpeed = (Math.random() - 0.5) * 0.03;
      this.alpha = 1;
      this.life = 0;
      this.maxLife = 90 + Math.random() * 40;
      this.sparkles = [];

      for (var i = 0; i < 24; i++) {
        var a = Math.random() * Math.PI * 2;
        var s = (2 + Math.random() * 4) * this.scale;
        this.sparkles.push({
          x: this.x,
          y: this.y,
          vx: Math.cos(a) * s,
          vy: Math.sin(a) * s,
          alpha: 1,
          size: 1.5 + Math.random() * 2,
          color: COLORS[Math.floor(Math.random() * COLORS.length)]
        });
      }
    }

    FlowerBlossom.prototype.update = function () {
      this.life++;
      this.angle += this.rotationSpeed;
      if (this.radius < this.targetRadius) {
        this.radius += (this.targetRadius - this.radius) * 0.12;
      }
      if (this.life > this.maxLife * 0.6) {
        this.alpha -= 0.025;
      }
      for (var i = 0; i < this.sparkles.length; i++) {
        var sp = this.sparkles[i];
        sp.x += sp.vx;
        sp.y += sp.vy;
        sp.vy += 0.04;
        sp.vx *= 0.98;
        sp.vy *= 0.98;
        sp.alpha -= 0.02;
      }
      return this.alpha > 0;
    };

    FlowerBlossom.prototype.draw = function (c) {
      c.save();
      c.translate(this.x, this.y);
      c.rotate(this.angle);

      // Draw 8 radiant oval petals of Adey Abeba
      for (var i = 0; i < this.petalCount; i++) {
        var rad = (Math.PI * 2 / this.petalCount) * i;
        c.save();
        c.rotate(rad);

        var grad = c.createRadialGradient(0, this.radius * 0.5, 2, 0, this.radius * 0.5, this.radius * 0.6);
        grad.addColorStop(0, 'rgba(255, 235, 59, ' + (0.95 * this.alpha) + ')');
        grad.addColorStop(0.7, 'rgba(255, 215, 0, ' + (0.85 * this.alpha) + ')');
        grad.addColorStop(1, 'rgba(255, 160, 0, ' + (0.4 * this.alpha) + ')');

        c.fillStyle = grad;
        c.beginPath();
        c.ellipse(0, this.radius * 0.5, this.radius * 0.22, this.radius * 0.52, 0, 0, Math.PI * 2);
        c.fill();
        c.restore();
      }

      // Draw vibrant golden flower center disc
      var centerGrad = c.createRadialGradient(0, 0, 1, 0, 0, this.radius * 0.22);
      centerGrad.addColorStop(0, 'rgba(255, 111, 0, ' + (0.95 * this.alpha) + ')');
      centerGrad.addColorStop(0.7, 'rgba(255, 143, 0, ' + (0.85 * this.alpha) + ')');
      centerGrad.addColorStop(1, 'rgba(255, 215, 0, ' + (0.5 * this.alpha) + ')');

      c.fillStyle = centerGrad;
      c.beginPath();
      c.arc(0, 0, this.radius * 0.22, 0, Math.PI * 2);
      c.fill();

      // Delicate flower ring stamens
      c.strokeStyle = 'rgba(255, 255, 255, ' + (0.8 * this.alpha) + ')';
      c.lineWidth = 1;
      c.beginPath();
      c.arc(0, 0, this.radius * 0.12, 0, Math.PI * 2);
      c.stroke();

      c.restore();

      // Draw sparkles
      for (var j = 0; j < this.sparkles.length; j++) {
        var sp = this.sparkles[j];
        if (sp.alpha > 0) {
          c.save();
          c.globalAlpha = Math.max(0, sp.alpha);
          c.fillStyle = sp.color;
          c.beginPath();
          c.arc(sp.x, sp.y, sp.size, 0, Math.PI * 2);
          c.fill();
          c.restore();
        }
      }
    };

    // Rocket Trail Particle
    function Rocket(targetX, targetY) {
      this.x = targetX + (Math.random() - 0.5) * 80;
      this.y = height + 10;
      this.targetY = targetY;
      this.speed = 10 + Math.random() * 4;
      this.trail = [];
      this.alive = true;
    }

    Rocket.prototype.update = function () {
      this.trail.push({ x: this.x, y: this.y, alpha: 1 });
      if (this.trail.length > 8) this.trail.shift();
      for (var i = 0; i < this.trail.length; i++) {
        this.trail[i].alpha -= 0.12;
      }
      this.y -= this.speed;
      if (this.y <= this.targetY) {
        this.alive = false;
        flowers.push(new FlowerBlossom(this.x, this.targetY, 8, 0.9 + Math.random() * 0.4));
      }
      return this.alive;
    };

    Rocket.prototype.draw = function (c) {
      c.save();
      for (var i = 0; i < this.trail.length; i++) {
        var t = this.trail[i];
        if (t.alpha > 0) {
          c.fillStyle = 'rgba(255, 215, 0, ' + Math.max(0, t.alpha) + ')';
          c.beginPath();
          c.arc(t.x, t.y, 2, 0, Math.PI * 2);
          c.fill();
        }
      }
      c.fillStyle = '#ffffff';
      c.beginPath();
      c.arc(this.x, this.y, 2.5, 0, Math.PI * 2);
      c.fill();
      c.restore();
    };

    // Ambient Drifting Adey Abeba Petals
    function DriftingPetal() {
      this.reset(true);
    }

    DriftingPetal.prototype.reset = function (initial) {
      this.x = Math.random() * width;
      this.y = initial ? Math.random() * height : -20;
      this.size = 6 + Math.random() * 8;
      this.speedY = 0.5 + Math.random() * 1.1;
      this.speedX = Math.sin(Math.random() * Math.PI) * 0.6;
      this.angle = Math.random() * Math.PI * 2;
      this.rotSpeed = (Math.random() - 0.5) * 0.04;
      this.alpha = 0.4 + Math.random() * 0.4;
      this.color = COLORS[Math.floor(Math.random() * 3)];
    };

    DriftingPetal.prototype.update = function () {
      this.y += this.speedY;
      this.x += Math.sin(this.y * 0.015) * 0.8;
      this.angle += this.rotSpeed;
      if (this.y > height + 20) {
        this.reset(false);
      }
    };

    DriftingPetal.prototype.draw = function (c) {
      c.save();
      c.translate(this.x, this.y);
      c.rotate(this.angle);
      c.globalAlpha = this.alpha;
      c.fillStyle = this.color;
      c.beginPath();
      c.ellipse(0, 0, this.size * 0.4, this.size, 0, 0, Math.PI * 2);
      c.fill();
      c.restore();
    };

    // Populate ambient petals
    for (var p = 0; p < 22; p++) {
      driftingPetals.push(new DriftingPetal());
    }

    // Launch automated fireworks periodically
    function launchAutoRocket() {
      if (document.hidden) return;
      var targetX = width * 0.15 + Math.random() * (width * 0.7);
      var targetY = height * 0.12 + Math.random() * (height * 0.45);
      rockets.push(new Rocket(targetX, targetY));
    }

    // Click to blossom anywhere
    window.addEventListener('click', function (e) {
      flowers.push(new FlowerBlossom(e.clientX, e.clientY, 8, 1));
    });

    // Main animation loop
    function loop(now) {
      if (!isRunning) return;

      if (now - lastLaunch > 2800 && rockets.length < 3) {
        launchAutoRocket();
        lastLaunch = now;
      }

      ctx.clearRect(0, 0, width, height);

      // Draw rockets
      for (var r = rockets.length - 1; r >= 0; r--) {
        if (!rockets[r].update()) {
          rockets.splice(r, 1);
        } else {
          rockets[r].draw(ctx);
        }
      }

      // Draw flowers
      for (var f = flowers.length - 1; f >= 0; f--) {
        if (!flowers[f].update()) {
          flowers.splice(f, 1);
        } else {
          flowers[f].draw(ctx);
        }
      }

      // Draw drifting petals
      for (var d = 0; d < driftingPetals.length; d++) {
        driftingPetals[d].update();
        driftingPetals[d].draw(ctx);
      }

      animFrame = requestAnimationFrame(loop);
    }

    animFrame = requestAnimationFrame(loop);

    // Pause animation when tab is not visible to save CPU/battery
    document.addEventListener('visibilitychange', function () {
      if (document.hidden) {
        isRunning = false;
        if (animFrame) cancelAnimationFrame(animFrame);
      } else {
        isRunning = true;
        lastLaunch = performance.now();
        animFrame = requestAnimationFrame(loop);
      }
    });

    // Cleanup for Turbolinks transitions
    function cleanup() {
      isRunning = false;
      if (animFrame) cancelAnimationFrame(animFrame);
      window.removeEventListener('resize', onResize);
      if (canvas && canvas.parentNode) canvas.parentNode.removeChild(canvas);
      if (banner && banner.parentNode) banner.parentNode.removeChild(banner);
    }

    document.addEventListener('turbolinks:before-cache', cleanup, { once: true });
    document.addEventListener('turbolinks:before-render', cleanup, { once: true });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initCelebration);
  } else {
    initCelebration();
  }
  document.addEventListener('turbolinks:load', initCelebration);
})();
