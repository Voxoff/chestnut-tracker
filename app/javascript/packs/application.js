require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

require("highlightjs-badge")

document.addEventListener('DOMContentLoaded', (event) => {
  document.querySelectorAll('pre code').forEach((block) => {
    hljs.highlightBlock(block);
    window.highlightJsBadge();
  });
});
