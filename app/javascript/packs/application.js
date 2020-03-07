require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

require("highlightjs-badge")

document.addEventListener('DOMContentLoaded', (event) => {
  document.querySelectorAll('pre code').forEach((block) => {
    // block = block.textContent.trim()
    hljs.highlightBlock(block);
    window.highlightJsBadge();
  });
});

// document.addEventListener('DOMContentLoaded', (event) => {
//       form = document.getElementById('company')
//     node = document.querySelector('.language-html')
//     url = "http://www.chestnut.com/tracker&referrer="
//     form.addEventListener('input', () => {
//       node.innerText = url + form.value
//     })
// });
