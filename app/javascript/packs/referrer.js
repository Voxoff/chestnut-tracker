document.addEventListener('DOMContentLoaded', (event) => {
  form = document.getElementById('company')
  node = document.querySelector('.language-html')
  url = `<header>http://www.chestnut.com/tracker&referrer=your_company</header>`
  form.addEventListener('input', () => {
    node.innerText = node.innerText.replace(/&referrer.*/, `&referrer=${form.value}</header>`)
    hljs.highlightBlock(node);
  })
});
