//判断用户的输入是否合法
function check(){
	if (myform.username.value==""){
		alert("Please enter your username !");myform.username.focus();return;
	}
	if (myform.truename.value==""){
		alert("Please enter your ture name!");myform.truename.focus();return;
	}
	if (myform.pwd.value==""){
		alert("Please enter your password !");myform.pwd.focus();return;
	}
	if (myform.pwd.value.length<1){
		alert("Password is at least 6 digits, please re-enter ！");myform.pwd.focus();return;
	}		
	if (myform.pwd1.value==""){
		alert("Please chack password ！");myform.pwd1.focus();return;
	}
	if (myform.pwd.value!=myform.pwd1.value){
		alert("It is different of two password ！");myform.pwd.focus();return;
	}
	if(myform.cardno.value==""){
		alert("Please enter passport number ！");myform.cardno.focus();return;
	}		
	if (myform.email.value==""){
		alert("Please enter E-mail ！");myform.email.focus();return;
	}
	var i=myform.email.value.indexOf("@");
	var j=myform.email.value.indexOf(".");
	if((i<0)||(i-j>0)||(j<0)){
		alert("It is wrong E-mail form ！");myform.email.value="";myform.email.focus();return;
	}
	myform.submit();		
}
function check_modi(){
	if (myform.truename.value==""){
		alert("Please enter ture name！");myform.truename.focus();return;
	}
	if (myform.oldpwd.value==""){
		alert("Please enter old password ！");myform.oldpwd.focus();return;
	}
	if(myform.holdpwd.value!=myform.oldpwd.value){
		alert("It is wrong old password ！");myform.oldpwd.value="";myform.oldpwd.focus();return;
	}
	if (myform.pwd.value==""){
		alert("Please enter new password ！");myform.pwd.focus();return;
	}
	if (myform.pwd.value.length<1){
		alert("New password need more than 6！");myform.pwd.focus();return;
	}		
	if (myform.pwd1.value==""){
		alert("Please enter password again ！");myform.pwd1.focus();return;
	}
	if (myform.pwd.value!=myform.pwd1.value){
		alert("It is different password of 2 times ！");myform.pwd.focus();return;
	}
	if(myform.cardno.value==""){
		alert("Please enter passport ！");myform.cardno.focus();return;
	}		
	if (myform.email.value==""){
		alert("Please enter E-mail ！");myform.email.focus();return;
	}
	var i=myform.email.value.indexOf("@");
	var j=myform.email.value.indexOf(".");
	if((i<0)||(i-j>0)||(j<0)){
		alert("It is wrong Email form ！");myform.email.value="";myform.email.focus();return;
	}
	myform.submit();		
}
function checkU(myform){
	if(myform.username.value==""){
		alert("Please enter username!");myform.username.focus();return;
	}
	if(myform.PWD.value==""){
		alert("Please enter password!");myform.PWD.focus();return;
	}
	myform.submit();
}

function checkM(myform){
	if(myform.manager.value==""){
		alert("Please enter admin account!");myform.manager.focus();return;
	}
	if(myform.PWD.value==""){
		alert("Please enter password!");myform.PWD.focus();return;
	}
	myform.submit();
}
function CheckAll(elementsA,elementsB){
	for(i=0;i<elementsA.length;i++){
		elementsA[i].checked = true;
	}
	if(elementsB.checked ==false){
		for(j=0;j<elementsA.length;j++){
			elementsA[j].checked = false;
		}
	}
}
//判断用户是否选择了要删除的记录，如果是，则提示“是否删除”；否则提示“请选择要删除的记录”
function checkdel(delid,formname){
	var flag = false;
	for(i=0;i<delid.length;i++){
		if(delid[i].checked){
			flag = true;
			break;
		}
	}
	if(!flag){
		alert("请选择要删除的记录！");
		return false;
	}else{
			if(confirm("确定要删除吗？")){
				formname.submit();
		}
	}
}