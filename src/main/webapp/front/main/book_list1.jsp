<%@page contentType="text/html;charset=utf-8" isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set value="${pageContext.request.contextPath }" var="path"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>当当图书 – 全球最大的中文网上书店</title>
		<link href="${path }/front/css/book.css" rel="stylesheet" type="text/css" />
		<link href="${path }/front/css/second.css" rel="stylesheet" type="text/css" />
		<link href="${path }/front/css/secBook_Show.css" rel="stylesheet" type="text/css" />
		<link href="${path }/front/css/list.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${path }/front/js/prototype-1.6.0.3.js"></script>
		<link href="${path }/front/css/glassstyle.css" rel="stylesheet"></link>
		<script type="text/javascript" src="${path }/front/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="${path }/front/js/lightzoom.js"></script>
		<script type="text/javascript">
		$(document).ready(function () {
			$('.light-zoom').lightzoom({
				zoomPower   : 3,    //Default
				glassSize   : 180,  //Default
			});
		});
		</script>
	</head>
	<body>
		&nbsp;

		<!-- 头部开始 -->
		<%@include file="../common/head.jsp"%>
		<!-- 头部结束 -->

		<div style="width: 962px; margin: auto;">
			<a href="#"><img src="${path }/front/images/default/book_banner_081203.jpg" border="0" /> </a>
		</div>
		<div class='your_position'>
			您现在的位置:&nbsp;
			<a href='${path }/book/main'>当当图书</a> &gt;&gt;
			<a href = "${path }/book/queryOneTwoCategory?fid=${requestScope.category.id }"><font style='color: #cc3300'><strong>${requestScope.category.cateName }</strong> </font></a>
			<c:forEach items="${requestScope.category.categoryList }" var="category2">
			<c:if test="${category2.id==sid}">
				&gt;&gt;<a href="${path}/queryOneTwoCategory?fid=${requestScope.category.id }&sid=${category2.id}"><font style='color: #cc3300'><strong>${category2.cateName}</strong> </font></a>
			</c:if>
			</c:forEach>
		</div>

		<div class="book">

			<!--左栏开始-->
			<strong>
			<div id="left" class="book_left">
				<div id="__fenleiliulan">
					<div class=second_l_border2>
						<h2>
							分类浏览
						</h2>
						<ul>
							<li>
								<div>
									<div class=second_fenlei>
										<c:if test="${request.sid==null }">
											<a href = "${path }/book/queryOneTwoCategory?fid=${requestScope.category.id }">&middot;<span style="color:red;">全部(${category.count })</span>&nbsp;</a>
										</c:if>
										<c:if test="${request.sid!=null }">
											<a href = "${path }/book/queryOneTwoCategory?fid=${requestScope.category.id }">&middot;全部(${category.count })&nbsp;</a>
										</c:if>
									</div>
								</div>
							</li>
							<div class="clear"></div>
							<c:forEach items="${requestScope.category.categoryList }" var = "category2">
							<!--2级分类开始-->
							<li>
								<div>
									<div class=second_fenlei>
										&middot;
									</div>
									<div class=second_fenlei>
									<c:if test="${category2.id==sid }">
										<a href="${path}/book/queryOneTwoCategory?fid=${requestScope.category.id }&sid=${category2.id}"><span style = "color:red;">${category2.cateName }(${category2.count })&nbsp;</span></a>
									</c:if>
									<c:if test="${category2.id!=sid }">
										<a href="${path}/book/queryOneTwoCategory?fid=${requestScope.category.id }&sid=${category2.id}">${category2.cateName }(${category2.count })&nbsp;</a>
									</c:if>
									</div>
								</div>
							</li>
						    <div class="clear"></div>
						    </c:forEach>
							<!--2级分类结束-->
							
							<li>
								<div></div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			</strong>
			<!--左栏结束-->
			
			<!--中栏开始-->
			<div class="book_center">

				<!--图书列表开始-->
				<div id="divRight" class="list_right">

					<div id="book_list" class="list_r_title">
						<div class="list_r_title_text">
							排序方式
						</div>
						<select onchange='' name='select_order' size='1'
							class='list_r_title_ml'>
							<option value="">
								按上架时间 降序
							</option>
						</select>
						<div id="divTopPageNavi" class="list_r_title_text3">

							<!--分页导航开始-->
							
							第${requestScope.currentPage }页&nbsp;&nbsp;&nbsp;
							<c:if test="${requestScope.currentPage!=1 }">
							<div class='list_r_title_text3a'>
								<a name=link_page_next href="${path }/book/queryOneTwoCategory?fid=${requestScope.fid}&sid=${requestScope.sid}&currentPage=1">
									<img src='${path }/front/images/page_up.gif' /> 
								</a>
							</div>
							</c:if>
							
							<c:if test="${requestScope.currentPage==1 }">
							<div class='list_r_title_text3a'>
								<img src='${path }/front/images/page_up_gray.gif' />
							</div> 
							</c:if>
							
							<c:if test="${requestScope.currentPage>1 }">
							<div class='list_r_title_text3a'>
								<a name=link_page_next href="${path }/book/queryOneTwoCategory?fid=${requestScope.fid}&sid=${requestScope.sid}&currentPage=${requestScope.currentPage-1}">
									<img src='${path }/front/images/page_up.gif' /> 
								</a>
							</div>
							
							</c:if>
							<c:if test="${requestScope.currentPage==1 }">
							<div class='list_r_title_text3a'>
								<img src='${path }/front/images/page_up_gray.gif' />
							</div> 
							</c:if>
							<div class='list_r_title_text3b'>
								
								<%-- <c:if test="${requestScope.currentPage > 1 }">
								<a href = "${path }/book/queryOneTwoCategory?fid=${requestScope.fid}&sid=${requestScope.sid}&currentPage=1">首页 </a>
								<a href = "${path }/book/queryOneTwoCategory?fid=${requestScope.fid}&sid=${requestScope.sid}&currentPage=${requestScope.currentPage-1}">上页</a>
								</c:if>
								
								<c:if test="${requestScope.currentPage ==1 }">
								<font color = "red">首页  上页</font>
								</c:if> --%>
								<c:forEach begin="1" step="1" end="${requestScope.totalPage }" var="i">
									<c:if test="${i==requestScope.currentPage }">
										<font color = "red">${i }</font>
									</c:if>
									<c:if test="${i!=requestScope.currentPage }">
										<a href = "${path }/book/queryOneTwoCategory?fid=${requestScope.fid}&sid=${requestScope.sid}&currentPage=${i}">${i }</a>
									</c:if>
								</c:forEach>
								
								<%-- <c:if test="${requestScope.currentPage < requestScope.totalPage }">
								<a href = "${path }/book/queryOneTwoCategory?fid=${requestScope.fid}&sid=${requestScope.sid}&currentPage=${requestScope.currentPage+1}">下页</a>
								<a href = "${path }/book/queryOneTwoCategory?fid=${requestScope.fid}&sid=${requestScope.sid}&currentPage=${requestScope.totalPage}">尾页</a>
								</c:if>
								
								<c:if test="${requestScope.currentPage == requestScope.totalPage }">
								<font color = "red">下页 尾页</font>
								</c:if> --%>
								
							</div>
							
							<c:if test="${requestScope.currentPage < requestScope.totalPage }">
							 <div class='list_r_title_text3a'>
								<a name=link_page_next href="${path }/book/queryOneTwoCategory?fid=${requestScope.fid}&sid=${requestScope.sid}&currentPage=${requestScope.currentPage+1}">
									<img src='${path }/front/images/page_down.gif' /> 
								</a>
							</div>
							</c:if>
							<c:if test="${requestScope.currentPage == requestScope.totalPage }">
							<div class='list_r_title_text3a'>
								<img src='${path }/front/images/page_down_gray.gif' />
							</div> 
							</c:if>
							
							<c:if test="${requestScope.currentPage == requestScope.totalPage }">
							<div class='list_r_title_text3a'>
								<img src='${path }/front/images/page_down_gray.gif' />
							</div> 
							</c:if>
							
							<c:if test="${requestScope.currentPage < requestScope.totalPage }">
							 <div class='list_r_title_text3a'>
								<a name=link_page_next href="${path }/book/queryOneTwoCategory?fid=${requestScope.fid}&sid=${requestScope.sid}&currentPage=${requestScope.totalPage}">
									<img src='${path }/front/images/page_down.gif' /> 
								</a>
							</div>
							</c:if>
							<!--分页导航结束-->
							共${requestScope.totalPage}页
						</div>
					</div>
					
					<!--商品条目开始-->
						
						<div class="list_r_line"></div>
						<c:forEach items="${requestScope.list }" var="book">
						<div class="clear"></div>
							<div class="list_r_list">
								<span class="list_r_list_book">
									<a name="link_prd_img" href='${path }/book/queryDetailBook?id=${book.id}'>
										<img class = "light-zoom" src="${path }/upload/imgFile/${book.src}" />
									</a>
								</span>
								<h2>
									<a name="link_prd_name" href='${path }/book/queryDetailBook?id=${book.id}'>${book.bookName }</a>
								</h2>
								<h3>
									顾客评分：100
								</h3>
								<h4 class="list_r_list_h4">
									作 者:
									<a href='#' name='作者'>${book.author }</a>
								</h4>
								<h4>
									出版社：
									<a href='#' name='出版社'>${book.company }</a>
								</h4>
								<h4>
									出版时间：<fmt:formatDate value="${book.publishTime }" pattern="yyyy-MM-dd hh:mm:ss" />
								</h4>
								<h5>
									${book.brief }
								</h5>
								<div class="clear"></div>
								<h6>
									<span class="del">￥${book.price }</span>
									<span class="red">￥${book.ddPrice }</span>
									节省：￥${book.price-book.ddPrice }
								</h6>
								<span class="list_r_list_button"> 
								<a href="${path }/cart/cart_addCartAction?id=${book.id}"> 
									<img src='${path }/front/images/buttom_goumai.gif' /> 
								</a>
								<span id="cartinfo"></span>
							</div>
						<div class="clear"></div>
					</c:forEach>
						
					
						<!--商品条目结束-->

					<div class="clear"></div>
					<div id="divBottomPageNavi" class="fanye_bottom">
					</div>

				</div>
				<!--图书列表结束-->

			</div>
			<!--中栏结束-->
			<div class="clear"></div>
		</div>

		<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->

	</body>
</html>

