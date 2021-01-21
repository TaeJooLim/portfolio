<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/erp/admin/include/HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common_table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/salary.css">
<!DOCTYPE html>
	<div class="page_wrap bg_white noto font_14">
            <div class="main_right bg_white" style="width: 100%;">
                <div class="main_right_title p_10" style="height: 50px; border-bottom: 1px solid #ccc;">
                    <h2 class="font_18">인사/급여관리<i class="fas fa-chevron-right p_lr10"></i>3. 급여처리내역</h2>
                </div>
                <div class="main_right_info" style="padding: 30px 20px;">
                    <div class="search_wrap m_b10">
                    <div class="tax_cal_btn_grp flex">
						<div class="total_list_btn m_r5" id="salaryUpdateBtn" style="background-color:crimson;width:95px;height:32px;">급여처리하기</div>
			            <div class="list_comment font_14 p_6" style="background-color: #f9f9f9;">
		                	<strong>급여처리하기</strong> 버튼을 누르시면 <strong>사원전체의 급여(당월)</strong>가 입력됩니다.
		                	<strong>비과세항목</strong>의 경우, <strong>자동</strong>으로 업데이트 됩니다.
		              	</div>
                    </div>
		            	<div class="total_cnt_btn_grp flex m_t5">
		            		<a href="${pageContext.request.contextPath}/admin/salary_list">
			                	<div class="total_list_btn m_r5">전체목록</div>
		            		</a>
		                	<div class="search_cnt_btn_grp flex">
		                    	<div class="left_radius_btn white">검색된 내역</div>
		                		<div class="right_radius_btn">${listCnt}건</div>
		                		<div class="bg_blue white font_18">연차수당, 식비, 야근, 출장비 어떻게 처리할지 고민필요</div>
		                		<div class="bg_blue white font_18">위에 컬럼들 같이 계산할거면 salary 테이블에 컬럼 추가해야함</div>
		                	</div>
		                </div>
		                <form id="" name="" action="">
			                <div class="search_grp flex m_t10">
			                	<select class="search_sel_box" id="" name="searchOpt">
			                    	<option value="emp_name">사원명</option>
			                    	<option value="emp_num">사원번호</option>
			                	</select>
				                <input type="month" class="m_l5 center" id="toDate" name="" />
			                    <input type="month" class="m_l5 center" id="searchDate" name="searchDate" />
			                	<input type="text" class="m_l5 p_l5" id="" name="words" value="" />
			                    <button type="submit" class="search_btn m_l5"><i class="fas fa-search font_18" style="color: #959595;"></i></button>
			                </div>
		                </form>
	                </div>
                    <div class="right_bottom">
                        <div class="w_100 white_s_no overflow_x_auto">
                            <table class="list">
                                <thead>
                                    <tr>
                                        <th class="td_3" rowspan="2">번호</th>
                                    <th class="td_4" rowspan="2">지급월</th>
                                    <th colspan="3">사원정보</th>
                                    <th colspan="5">비과세항목</th>
                                    <th colspan="7">공제항목</th>
                                    <th class="weight_700 td_7" rowspan="2">실수령액</th>
                                    <th class="" rowspan="2">관리</th>
                                </tr>
                                <tr>
                                    <th class="td_7">사원번호</th>
                                    <th class="td_10">사원명</th>
                                    <th class="td_7 weight_700">기본금</th>
                                    <th>호봉수당</th>
                                    <th>직책수당</th>
                                    <th>식대</th>
                                    <th>추가근무수당</th>
                                    <th class="td_7">소계</th>
                                    <th>국민연금</th>
                                    <th>건강보험</th>
                                    <th>장기요양</th>
                                    <th>고용보험</th>
                                    <th>소득세</th>
                                    <th class="td_5">지방소득세</th>
                                    <th class="td_7">소계</th>
                                </tr>
                                </thead>
                                <tbody>
                                	<c:choose>
                                		<c:when test="${empty sList}">
                                			<tr>
                                				<td colspan="20">급여지급내역이 없습니다.</td>
                                			</tr>
                                		</c:when>
                                		<c:otherwise>
											<c:forEach items="${sList}" var="slist" varStatus="status">
			                                    <tr>
			                                        <td>${(listCnt - status.index) - ((pagingvo.curPage - 1) * pagingvo.pageSize)}</td>
			                                        <td>${slist.salaryDate}</td>
			                                        <td>${slist.empNum}</td>
			                                        <td>${slist.empDepartmentName} ${slist.empName} ${slist.empPositionName}</td>
			                                        <td class="weight_700">
			                                        	<fmt:formatNumber value="${slist.salaryPay}" pattern="#,###"/>
			                                        </td>
			                                        <td>
			                                        	<fmt:formatNumber value="${slist.empStep}" pattern="#,###"/>
			                                       </td>
			                                        <td>
			                                        	<fmt:formatNumber value="${slist.empHeadcheck}" pattern="#,###"/>
			                                        		
			                                        </td>
			                                        <td>
			                                        	<fmt:formatNumber value="${slist.salaryFood}" pattern="#,###"/>
			                                        </td>
			                                        <td>
			                                        	<fmt:formatNumber value="${slist.salaryOvertimePay}" pattern="#,###"/>
			                                        </td>
			                                        <td class="weight_700">
			                                        	<fmt:formatNumber value="${slist.salaryNontaxTotalcost}" pattern="#,###"/>
			                                        </td>
			                                        <td>
			                                        	<fmt:formatNumber value="${slist.salaryNps}" pattern="#,###"/>
			                                        </td>
			                                        <td>
			                                        	<fmt:formatNumber value="${slist.salaryHInsurance}" pattern="#,###"/>
			                                        </td>
			                                        <td>
			                                        	<fmt:formatNumber value="${slist.salaryCare}" pattern="#,###"/>
			                                        </td>
			                                        <td>
			                                        	<fmt:formatNumber value="${slist.salaryEInsurance}" pattern="#,###"/>
			                                        </td>
			                                        <td>
			                                        	<fmt:formatNumber value="${slist.salaryIncome}" pattern="#,###"/>
			                                        </td>
			                                        <td>
			                                        	<fmt:formatNumber value="${slist.salaryLIncome}" pattern="#,###"/>
			                                        </td>
			                                        <td class="weight_700">
			                                        	<fmt:formatNumber value="${slist.salaryTotalcost}" pattern="#,###"/>
			                                        </td>
			                                        <td class="weight_700">
			                                        	<fmt:formatNumber value="${slist.netPay + slist.salaryNontaxTotalcost}" pattern="#,###"/>
			                                        </td>
			                                        <td>
			                                        	<button type="button" class="s_btn_gray" onClick="window.open('${pageContext.request.contextPath}/admin/salaryForm?sformId=${slist.sformId}')">출력</button>
			                                        </td>
			                                    </tr>
											</c:forEach>
                                		</c:otherwise>
                                	</c:choose>
                                </tbody> 
                            </table>
                        </div>
                    </div>
                </div>
                <%@ include file="/WEB-INF/views/erp/admin/include/PAGING.jsp" %>
				<script>
					$(function() {
						$("#toDate").hide();
						document.getElementById('searchDate').valueAsDate = new Date();
						document.getElementById('toDate').valueAsDate = new Date();
						$("#salaryUpdateBtn").click(function() {
							setSalaryAll();
						});

						var curHref = "/erp/admin/salary_list";

						function fn_paging(curPage) {
							var searchTXT = "?searchOpt=${searchOpt}&words=${words}&curPage=";
							window.location.href = curHref + searchTXT + curPage;
						};
					});
					
				</script>
				<script src="${pageContext.request.contextPath}/js/salary.js"></script>
<%@ include file="/WEB-INF/views/erp/admin/include/FOOTER.jsp"%>