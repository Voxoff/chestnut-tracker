
// document.addEventListener('DOMContentLoaded', (event) => {
      form = document.getElementById('company')
    node = document.querySelector('.language-html')
    url = "http://www.chestnut.com/tracker&referrer="
    form.addEventListener('input', () => {
      node.innerText = url + form.value
    })
// });
