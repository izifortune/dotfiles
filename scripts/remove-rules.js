function removeCurrent() {
  var a = $('.selected').nextSibling;
  $('.cwui-dropdown-toggle').click();
  $('.menu-item:nth-child(2)').click();
  $('.btn-danger').click();
  a.click();
}

for (let i = 0; i < 5; i++) {
  removeCurrent();
}
