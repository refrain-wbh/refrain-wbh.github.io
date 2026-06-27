---
layout: page
title: The Verification Horizon
permalink: /papers/verification-horizon/
nav: false
description: No Silver Bullet for Coding Agent Rewards — Qwen Team Technical Report (中文 / English)
---

<div class="paper-reader">
  <div class="paper-actions">
    <a class="btn btn-sm z-depth-0" role="button" href="https://arxiv.org/abs/2606.26300" target="_blank" rel="noopener">arXiv</a>
    <a class="btn btn-sm z-depth-0" role="button" href="https://arxiv.org/pdf/2606.26300" target="_blank" rel="noopener">PDF</a>
    <span class="paper-lang-toggle">
      <button type="button" id="paper-btn-zh" class="lang-btn active">中文</button>
      <button type="button" id="paper-btn-en" class="lang-btn">English</button>
    </span>
  </div>

  <iframe
    id="paper-frame"
    title="The Verification Horizon"
    src="{{ '/assets/papers/verification-horizon/zh.html' | relative_url }}"
    loading="lazy"
  ></iframe>
</div>

<script>
  (function () {
    var frame = document.getElementById("paper-frame");
    var srcs = {
      zh: "{{ '/assets/papers/verification-horizon/zh.html' | relative_url }}",
      en: "{{ '/assets/papers/verification-horizon/en.html' | relative_url }}",
    };
    function resize() {
      try {
        var doc = frame.contentWindow.document;
        frame.style.height = doc.body.scrollHeight + 40 + "px";
      } catch (e) {
        frame.style.height = "90vh";
      }
    }
    frame.addEventListener("load", function () {
      resize();
      // re-measure after fonts / MathJax finish
      setTimeout(resize, 500);
      setTimeout(resize, 1500);
      setTimeout(resize, 3000);
    });
    window.addEventListener("resize", resize);
    function setLang(lang) {
      document.getElementById("paper-btn-zh").classList.toggle("active", lang === "zh");
      document.getElementById("paper-btn-en").classList.toggle("active", lang === "en");
      frame.src = srcs[lang];
    }
    document.getElementById("paper-btn-zh").addEventListener("click", function () { setLang("zh"); });
    document.getElementById("paper-btn-en").addEventListener("click", function () { setLang("en"); });
  })();
</script>

<hr>

<h2 id="comments">Comments</h2>

{% include giscus.liquid %}
