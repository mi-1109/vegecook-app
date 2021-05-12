// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require cocoon

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

  $(document).ready(function(){
    $('.heading-slider').bxSlider({
      mode: 'fade',
      slideWidth: 1200,
      moveSlides: 1,
      maxSlides: 1,
      speed: 800,
      auto: true,
      stopAutoOnClick: true,
      autoHover: true,
    });
  });

  $(document).ready(function(){
    $('.latest-slider').bxSlider({
      mode: 'horizontal',
      easing: 'linear',
      captions: true,
      slideWidth: 150,
      auto: true,
      stopAutoOnClick: true,
      maxSlides: 4,
      slideMargin: 60,
      pager: false,
      speed: 900,
      controls: false
    });
  });
  
// 行挿入時のインデックス作成のためのグローバル変数
var count = 10;
  function addRow(table_id) {
    var table = document.getElementById(table_id)
    window.count += 1;

    // tr(行)を末尾に追加
    var row = table.insertRow(-1);
    // td追加
    var cell1 = row.insertCell(-1);
    var cell2 = row.insertCell(-1);
    var cell3 = row.insertCell(-1);


    //つくり方の場合
    if (table_id == "procedure-table"){
      cell1.innerHTML = '<textarea name="post_recipe[procedures_attributes][' + window.count + '][body]" id="post_recipe_body" placeholder="つくり方を記入" class="p-2 " cols="80" rows="3"></textarea>';
      cell1.classList.add('pl-0');
      cell2.innerHTML = '<input type="button" value="削除" onclick="deleteRow(this)">';
      cell2.classList.add('align-middle');
    } else {
      cell1.innerHTML = '<input type="text" name="post_recipe[ingredients_attributes][' + window.count + '][name]" id="post_recipe_name" placeholder="例）にんじん" >';
      cell1.classList.add('py-1');
      cell2.innerHTML = '<input type="text" name="post_recipe[ingredients_attributes][' + window.count + '][amount]" id="post_recipe_amount" placeholder="例）一本" >';
      cell2.classList.add('py-1');
      cell3.innerHTML = '<input type="button" value="削除" onclick="deleteRow(this)">';
      cell3.classList.add('p-0', 'align-middle');
    }
  }

  function deleteRow(obj) {
    // 削除されたボタンを特定
    tr = obj.parentNode.parentNode;
    // trのインデックスを取得して行を削除
    tr.parentNode.deleteRow(tr.sectionRowIndex);
  }


