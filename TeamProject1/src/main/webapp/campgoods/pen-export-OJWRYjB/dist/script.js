function openNav() {
  document.getElementById("myNav").style.display = "block";
}

function closeNav() {
  document.getElementById("myNav").style.display = "none";
}
function includeHTML() {
  var z, i, elmnt, file, xhttp;
  /*loop through a collection of all HTML elements:*/
  z = document.getElementsByTagName("*");
  for (i = 0; i < z.length; i++) {
    elmnt = z[i];
    /*search for elements with a certain atrribute:*/
    file = elmnt.getAttribute("w3-include-html");
    if (file) {
      /*make an HTTP request using the attribute value as the file name:*/
      xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4) {
          if (this.status == 200) {elmnt.innerHTML = this.responseText;}
          if (this.status == 404) {elmnt.innerHTML = "Page not found.";}
          /*remove the attribute, and call this function once more:*/
          elmnt.removeAttribute("w3-include-html");
          includeHTML();
        }
      }
      xhttp.open("GET", file, true);
      xhttp.send();
      /*exit the function:*/
      return;
    }
  }
};

function doOpenCheck(chk){
    var obj = document.getElementsByName("aaa");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
//scroll
//옵션상품 DIV 추가
	function addRow(seq, groupNo, optionNo, essentialYn, optionProductCd,optionProductCol, optionProductNm, price) {
		
		var productCd = 'HSK124BS';
		var productCol = $("#select_color option:selected").data("productCol");
		
		//20180131		
		var formatedPrice = numberWithCommas(price);
		var essential = essentialYn == 'Y' ? "[필수]" : "[선택]";
		var quantity = 1;
		var html = '<div data-option class=\"group'+groupNo+' option'+optionNo+'\" data-product-cd=\"'+productCd+'\" data-product-col=\"'+productCol+'\" data-option-product-cd=\"'+optionProductCd+'\" data-option-product-col=\"'+optionProductCol+'\" data-option-no=\"'+optionNo+'\"> <div class=\"add\"><b>'
				+ essential
				+ '</b>&nbsp;&nbsp; <span style=\"line-height:20px;\">'
				+ optionProductNm
				+ "</span><br><span style=\"color:#AAAAAA; line-height:20px;\"> 색상 : "+ optionProductCol+ '</span></div>'
				+ '<div class=\"optionCtn\">'
				+ '<button class=\"countBtn countDown\" onClick=\"countControll(\'decrease\','+ groupNo+ ','+ optionNo+ ',\''+ essentialYn+ '\')\"></button><div class=\"numberUpDown\"><span class=\"quantity\" data-group-no=\"'+groupNo+'\" data-option-no=\"'+optionNo+'\">'
				+ quantity+ '</span></div>'
				+ '<button class=\"countBtn countUp\" onClick=\"countControll(\'increase\','+ groupNo+ ','+ optionNo+ ',\''+ essentialYn+ '\')\"></button></div>'//수량 올림
				+ '<div class=\"opPrice\">'
				+ formatedPrice+ '원</div>'
				+ '<div><button class=\"opDelete\" onClick=\"deleteOptionProduct('+ groupNo+ ','+ optionNo+ ',\''+ essentialYn+ '\')\"></button></div>'//옵션상품 삭제
				+ '<div style=\"clear:both\"></div></div>';

		$(".addOption").append(html);
		$(".group" + groupNo).css('display', 'none');

	}
		
	 //수량조절
	 function countControll(countType, groupNo, optionNo, essentialYn) {
		 
			var p = 0;				
			var stat = $('.quantity[data-option-no="' + optionNo+ '"][data-group-no="' + groupNo + '"]').html();
			var num = stat * 1;
			
			var stat2 = $('.totalPrice').html().replace(/,/gi,"");
			var num2 = stat2 * 1;			
			var result=0;

			// 재고 validation					2019. 09. 18.  최현서
			var stock = $("#select_color option:selected").data("stock");

			num = (countType == 'increase') ? num + 1 : ((num == 1) ? alert("구매를 원하지 않으시면, 삭제버튼을 눌러주세요") :num - 1);

			if(stock != -1 && num > stock) {

				alert("재고 수량보다 많은 수량을 주문할 수 없습니다.")
				return false;

			} else {

				if (essentialYn == 'Y') { //필수상품
				
					$.each(groupInfo,function(groupKey, groupVal) {		
						
						$.each(groupVal,function(groupKey2,groupVal2) {
							
							if (groupKey == groupNo && groupVal2.essentialYn == 'Y') {
								
								if(countType == 'increase')	{
									
									groupVal2.optionProductCnt = groupVal2.optionProductCnt + 1;
									p = parseInt(groupVal2.price,10)+parseInt(p,10);
								
								}else{
									
									if(groupVal2.optionProductCnt != 1)
										
										p = parseInt(groupVal2.price,10)+parseInt(p,10);
										groupVal2.optionProductCnt = (groupVal2.optionProductCnt == 1) ? 1: groupVal2.optionProductCnt - 1;					
									
								}
								$('.quantity[data-option-no="'+ groupVal2.optionNo+ '"][data-group-no="'+ groupKey+ '"]').html(num); //UI 수량 변경
								
							}
						});

					});
					
					if(countType == "increase"){
						result = num2 + parseInt(p);
						
					}else{
						result = num2 - parseInt(p);	
						
						
					}
					$('.totalPrice').html(numberWithCommas(result));
				
				
				} else { //선택상품
				
					$('.quantity[data-option-no="' + optionNo + '"][data-group-no="' + groupNo + '"]').html(num); //UI 수량 변경

					$.each(groupInfo,function(groupKey, groupVal) {

						$.each(groupVal,function(groupKey2,groupVal2) {

								if (groupKey == groupNo && groupVal2.optionNo == optionNo){
									
									if(countType == 'increase')	{
										
										groupVal2.optionProductCnt = groupVal2.optionProductCnt + 1;
										p = parseInt(groupVal2.price,10)+parseInt(p,10);
										
									}else {
										
										if(groupVal2.optionProductCnt != 1)
											p = parseInt(p,10)+parseInt(groupVal2.price,10);
										
										groupVal2.optionProductCnt = (groupVal2.optionProductCnt == 1) ? 1: groupVal2.optionProductCnt - 1;
										
									}
								}
								
						});
					});
					if(countType == 'increase'){							
						result = num2 + parseInt(p);
					}else{							
						result = num2 - parseInt(p);
					}
					$('.totalPrice').html(numberWithCommas(result));											
				}					
				//data 저장여부 확인용
				$.each(groupInfo, function(key, val) {
					var jsonInfo = JSON.stringify(val);					
				});
			}
	}
		 
	 //상품 DIV 삭제
	 function deleteOptionProduct(groupNo, optionNo, essentialYn){
			
			var p =0; //삭제할 상품 가격 ex. 2000원짜리 상품 2개 삭제 시, 4000원
			var stat = $('.totalPrice').html().replace(/,/gi,"");
			var num = stat * 1;
			
			if (essentialYn == 'Y') { //필수옵션 상품
				
				var result = confirm('필수옵션 상품 삭제 시, 그룹 전체가 삭제됩니다.\n삭제하시겠습니까?');
			
				if(result) {	
					$.each(groupInfo,function(groupKey, groupVal) {
						
							if (groupKey == groupNo) {
								
								delete groupInfo[groupKey];
								$('.group'+groupKey).last().next().remove();			
								$('.group'+groupKey).remove();	
							}	
														
							$.each(groupVal,function(groupKey2, groupVal2){								
								if (groupKey == groupNo) {					
								p = parseInt(p,10)+(parseInt(groupVal2.price,10)*parseInt(groupVal2.optionProductCnt,10));

								}
		
							});				
					});	
					
					var result = num - parseInt(p);
					$('.totalPrice').html(numberWithCommas(result));					
				}
			} else {
						
				//선택옵션 상품
				$.each(groupInfo,function(groupKey, groupVal) {

					$.each(groupVal,function(groupKey2,groupVal2) {

						if (groupKey == groupNo && groupVal2.optionNo == optionNo){								
							groupVal.splice(groupKey2,1); // 데이터 삭제							
							$('.group'+groupKey+'.option'+optionNo).remove(); //UI 삭제
							p = parseInt(p,10)+(parseInt(groupVal2.price,10)*parseInt(groupVal2.optionProductCnt,10)); //삭제한 상품 가격		
						}										
					});			
				});
				
				var result = num - parseInt(p);
				$('.totalPrice').html(numberWithCommas(result));
			}
			
			/*   삭제 결과 확인   */	
			$.each(groupInfo, function(key, val) {				
				var jsonInfo = JSON.stringify(val);				
			});			
	}