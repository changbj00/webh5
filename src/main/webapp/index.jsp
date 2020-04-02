<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>页面1</title>
    <script type="text/javascript" src="/webh5/js/jquery-3.1.1.min.js"></script>
	<style>
        #username-info{
            display: none;
            border: none;
        }
        label{
            display: block;
            margin-top: 3px;
        }
    </style>
</head>


<body>
<h1>模拟商家h5跳转页面</h1>
<br>
<form id="myForm">
	borrowid:<input type="text" id="borrowid"/><br/>
	pid:<input type="text" id="pid" /><br>
	uid:<input type="text" id="uid"/><br>
	borrowid_sec:<input type="text" id="borrowid_sec"/><br>
	status:<input type="text" id="status"/><br>
	nextPage:<input type="text" id="nextPage"/><br>
</form>
<form >
	<input type="button" value="AES加密" onclick="javascrtpt:one()"/><br>
	daily:<input type="checkbox" id="daily" onclick="check()">
	online:<input type="checkbox" id="online" onclick="check()">
</form>
<form id="daliy">
	<input type="button" value="提现结果" onclick="javascrtpt:test('1')"/>
	<input type="button" value="绑卡结果" onclick="javascrtpt:test('2')"/>
	<input type="button" value="签约结果" onclick="javascrtpt:test('3')"/>
	<input type="button" value="还款结果" onclick="javascrtpt:test('4')"/>
	<input type="button" value="数据认证" onclick="javascrtpt:test('5')"/>
</form>

<script LANGUAGE="JavaScript">
	var pid = document.getElementById('pid').value;
	var borrowid_sec = document.getElementById('borrowid_sec').value;
	var uid = document.getElementById('uid').value;
	var status = document.getElementById('status').value;
    var nextPage = document.getElementById('nextPage').value;
	var timestamp = (new Date()).getTime();
	var daily='https://d1.shurongdai.cn';
	var online='https://mrongshu.shurongdai.cn';
	var url1='https://www.baidu.com';
    var url2='/rongshu/src/p/bindCardBack/index.html?pid='+pid+'&borrowId='+borrowid_sec+'&timestamp='+timestamp+'&uid='+uid+'&status='+status+'&nextPage='+nextPage+'&cardType=1&bankCardId=-1&wallet=0&GRAY';
    var url3='/rongshu/src/p/contractBack/index.html?pid='+pid+'&borrowId='+borrowid_sec+'&timestamp='+timestamp+'&uid='+uid+'&status='+status+'&nextPage='+nextPage+'&wallet=0&GRAY';
    var url4='/rongshu/src/p/repaytext/index.html?pid='+pid+'&borrowId='+borrowid_sec+'&timestamp='+timestamp+'&uid='+uid+'&status='+status+'&nextPage='+nextPage+'&wallet=0&GRAY';
    var url5='/rongshu/src/p/operatorBack/index.html?pid='+pid+'&borrowId='+borrowid_sec+'&timestamp='+timestamp+'&uid='+uid+'&status='+status+'&nextPage='+nextPage+'&isDataAuth=1&wallet=0&GRAY';
function test(a){

    if(a=='1')
    	{window.location.href=url1;}
    if(a=='2')
    	{window.location.href=url2;}
    if(a=='3')
		{window.location.href=url3;}
    if(a=='4')
		{window.location.href=url4;}
    if(a=='5')
		{window.location.href=url5;}
    }

function one(){
	var borrowid=document.getElementById("borrowid").value;
    if(borrowid!=undefined&&borrowid.length>0){
        $.ajax({
            type:"post",//type可以为post也可以为get
            url:"demo2",
            data:{"borrowid":borrowid},//这行不能省略，如果没有数据向后台提交也要写成data:{}的形式
            dataType:"json",//这里要注意如果后台返回的数据不是json格式，那么就会进入到error:function(data){}中
            success:function(data){
                $("#borrowid_sec").val(data.info);
            },
            error:function(data){
                alert("borrowid提交出现了错误！");
            }
        });
    }else{
        alert("borrowid不能为空！")
        return false;
    }
}
function check() {
	var dailybox=document.getElementById("daily");
	var onlinebox=document.getElementById("online");
	if (dailybox.checked==true){
	    url2=daily+url2;
	    url3=daily+url3;
	    url4=daily+url4;
	    url5=daily+url5;
	}
	if (onlinebox.checked==true){
        url2=online+url2;
        url3=online+url3;
        url4=online+url4;
        url5=online+url5;
	}
}



</script>
</body>
</html>