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
	<input type="button" value="AES加密" onclick="javascrtpt:one()"/>
	<input type="button" value="提现结果" onclick="javascrtpt:test('1')"/>
	<input type="button" value="绑卡结果" onclick="javascrtpt:test('2')"/>
	<input type="button" value="签约结果" onclick="javascrtpt:test('3')"/>
	<input type="button" value="还款结果" onclick="javascrtpt:test('4')"/>
	<input type="button" value="数据认证" onclick="javascrtpt:test('5')"/>
<script LANGUAGE="JavaScript">
function test(a){
	var pid = document.getElementById('pid').value;
	var borrowid_sec = document.getElementById('borrowid_sec').value;
	var uid = document.getElementById('uid').value;
	var status = document.getElementById('status').value;
    var nextPage = document.getElementById('nextPage').value;
	var timestamp = (new Date()).getTime();
	var url1='https://www.baidu.com';
    var url2='https://mrongshu.shurongdai.cn/rongshu/src/p/bindCardBack/index.html?pid='+pid+'&borrowId='+borrowid_sec+'&timestamp='+timestamp+'&status='+status+'&nextPage='+nextPage+'&cardType=1&bankCardId=-1&wallet=0&uid='+uid+'&GRAY';
    var url3='https://mrongshu.shurongdai.cn/rongshu/src/p/contractBack/index.html?pid='+pid+'&borrowId='+borrowid_sec+'&timestamp='+timestamp+'&status='+status+'&nextPage='+nextPage+'&wallet=0&uid='+uid+'&GRAY';
    var url4='https://mrongshu.shurongdai.cn/rongshu/src/p/repaytext/index.html?pid='+pid+'&borrowId='+borrowid_sec+'&timestamp='+timestamp+'&status='+status+'&nextPage='+nextPage+'&wallet=0&uid='+uid+'&GRAY';
    var url5='https://mrongshu.shurongdai.cn/rongshu/src/p/operatorBack/index.html?pid='+pid+'&borrowId='+borrowid_sec+'&timestamp='+timestamp+'&status='+status+'&nextPage='+nextPage+'&isDataAuth=1&wallet=0&uid='+uid+'&GRAY';
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




</script>
</body>
</html>