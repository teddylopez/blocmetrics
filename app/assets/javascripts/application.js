// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require Chart.bundle
//= require chartkick
//= require turbolinks
//= require_tree .

// Script for fade-out notices and alerts
  $(document).ready(function(){
    setTimeout(function(){
      $('#notice-wrapper').fadeOut("slow", function() {
        $(this).remove();
      })
    }, 2000);
  });

$(document).ready(function(){
  var codeArr = document.getElementsByTagName('code');
  for(var i=0; i<codeArr.length; i++) {
    var data = codeArr[i].innerHTML;
    data = data.replace(/"(.*?)"/g, '<span class="code-str">&quot;$1&quot;</span>');
    data = data.replace(/'(.*?)'/g, '<span class="code-str">&quot;$1&quot;</span>');
    data = data.replace(/var(.*?)/g, '<span class="code-elem">var</span>');
    data = data.replace(/&lt;(.*?)&gt;/g, '<span class="code-elem">&lt;$1&gt;</span>');
    data = data.replace(/\/\* (.*?) \*\//g, '<span class="code-comment">/* $1 */</span>');
    codeArr[i].innerHTML = data;
  }
});
window.addEventListener("load", syntaxHighlights);
