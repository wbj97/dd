<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../css/btn.css" />
	
<style type="text/css">
td{
	padding-top: 8px;
}
#file_upload1 {
	display: none;
}
#file_upload1_label {
	display: inline-block;
	border: 1px solid #aaa;
	width: 120px;
	height: 145px;
	margin-left: 20px;
	text-align: center;
	line-height: 145px;
	cursor: pointer;
}
</style>


</head>

<body style="background-color: #f0f9fd;text-align: center">
	<div style="font-size:25px">修改图书信息</div>
	<hr />
	<div align="center">
	<form action="${path }/book/modifyBook" method="post" enctype="multipart/form-data">
			<table>
			<tr><td colspan = "5"><input type = "hidden" name = "id" value="${requestScope.book.id }"/></td></tr>
				<tr>
					<td>名称：</td>
					<td><input type="text" name="bookName" class="el-input__inner" value="${requestScope.book.bookName }"></td>
					<td rowspan="14" style="width: 300px">
					<td>页数：</td>
					<td><input type="number" name="pagination" class="el-input__inner" value="${requestScope.book.pagination }" ></td>
				</tr>
				<tr>
					<td>所属分类：</td>
					<td>
						<select name="cateId" class="el-select__inner inner2">
							<c:forEach items="${requestScope.list1 }" var="category">
								<c:if test="${category.id == book.cateId}">
									<option value="${category.id }" selected>${category.cateName }</option>
								</c:if>
								<c:if test="${category.id != book.cateId}">
									<option value="${category.id }" >${category.cateName }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td>字数：</td>
					<td><input type="number" name="publicCount" class="el-input__inner" value="${requestScope.book.publicCount }" ></td>
				</tr>
				
				<tr>
					<td>原价：</td>
					<td><input type="number" name="price" class="el-input__inner" value="${requestScope.book.price }"></td>
					<td>封面：</td>
					<td rowspan="3">
						<label id="file_upload1_label" for="file_upload1">
							<img id="uploadimg" src="${path }/upload/imgFile/${book.src}" alt="" width="120" height="145" />
						</label>
						<input type="file" name="imgFile" class="" id="file_upload1" 	onchange="upload_review()">
					</td>
				</tr>
				
				<tr>
					<td>当当价：</td>
					<td><input type=number name="ddPrice" class="el-input__inner" value="${requestScope.book.ddPrice }"></td>
					<td></td>
				</tr>
				<tr>
					<td>库存：</td>
					<td><input type="number" name="stock " class="el-input__inner" value="${requestScope.book.stock }"></td>
					<td></td>
				</tr>
				<tr>
					<td>作者：</td>
					<td><input type="text" name="author" class="el-input__inner" value="${requestScope.book.author }"></td>
					<td>编辑推荐：</td>
					<td rowspan="2"><textarea class="el-textarea__inner" name="recom">${requestScope.book.recom }</textarea></td>
				</tr>
				<tr>
					<td>出版社：</td>
					<td><input type="text" name="company" class="el-input__inner" value="${requestScope.book.company }"></td>
					<td></td>
				</tr>
				<tr>
					<td>出版时间：</td>
					<td><input type="date" name="publishTime" class="el-input__inner" value="${requestScope.book.publishTime }"></td>
					<td>内容简介：</td>
					<td rowspan="2"><textarea class="el-textarea__inner" name="brief" >${requestScope.book.brief }</textarea></td>
				</tr>
				<tr>
					<td>版次：</td>
					<td><input type="text" name="edition " class="el-input__inner" value="${requestScope.book.edition }"></td>
					<td></td>
				</tr>
				<tr>
					<td>印刷时间：</td>
					<td><input type="date" name="printTime" class="el-input__inner" value="${requestScope.book.printTime }' />"></td>
					<td>作者简介：</td>
					<td rowspan="2"><textarea class="el-textarea__inner" name="aboutAuthor">${requestScope.book.aboutAuthor }</textarea></td>
				</tr>
				<tr>
					<td>印次：</td>
					<td><input type="text" name="impression" class="el-input__inner" value="${requestScope.book.impression }"></td>
					<td></td>
				</tr>
				<tr>
					<td>ISBN：</td>
					<td><input type="text" name="isbn" class="el-input__inner" value="${requestScope.book.isbn }"></td>
					<td>基本目录：</td>
					<td rowspan="2"><textarea class="el-textarea__inner" name="directory" >${requestScope.book.directory }</textarea></td>
				</tr>
				<tr>
					<td>开本：</td>
					<td><input type="text" name="book.format" class="el-input__inner" value="${requestScope.book.format }"></td>
					<td></td>
				</tr>
				<tr>
					<td>纸张：</td>
					<td><input type="text" name="book.paper" class="el-input__inner" value="${requestScope.book.paper }"></td>
					<td>媒体评论：</td>
					<td rowspan="2"><textarea class="el-textarea__inner" name="book.media">${requestScope.book.media }</textarea></td>
				</tr>
				<tr>
					<td>包装：</td>
					<td><input type="text" name="book.packaging" class="el-input__inner" value="${requestScope.book.packaging }"></td>
					<td></td>
				</tr>
			</table>
			<input type="submit" class="button btn-p" value="提交" />&emsp; 
			<input type="button" class="button btn-p" value="返回上级" onclick="history.go(-1);" />
		</form>
	</div>
	<script>
		function upload_review() {
			var img = document.getElementById("uploadimg");
			var input = document.getElementById("file_upload1");
			var tip = document.getElementById("uploadtip");			

			var file = input.files.item(0);
			var freader = new FileReader();
			freader.readAsDataURL(file);
			freader.onload = function(e) {
				img.src = e.target.result;
				tip.style.display = "none";
			};
		}
	</script>
</body>
</html>

