<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>新增学生</title>
		<link rel="stylesheet" href="${basepath}static/gxjf/bs/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${basepath}static/gxjf/css/Employee.css" />
		<link rel="stylesheet" href="${basepath}static/gxjf/css/framework-font.css" />
		<!-- 日期框 -->
		<link rel="stylesheet" href="${basepath}static/ace/css/datepicker.css" />
		<link href="${basepath}static/js/layer/skin/default/layer.css" rel="stylesheet">
		<script src="${basepath}static/ace/js/date-time/bootstrap-datepicker.js"></script>
		<!--身份证校验  -->
		<script type="text/javascript" src="${basepath}static/js/cardcheck.js"></script>
	   
		
		<!-- ztree所需css以及js -->
        <link rel="stylesheet" href="${basepath}static/zTree/css/zTreeStyle/metro.css">
	    <script type="text/javascript" src="${basepath}static/zTree/js/jquery.ztree.core.js"></script>
	    <script type="text/javascript" src="${basepath}static/zTree/js/jquery.ztree.excheck.js"></script>
		
		
		<style type="text/css">
			html { overflow-x:hidden; }
			.jf_label{
				width: 75px;
				text-align: right;
			}
			.form-control{
				width:170px !important;
			}
			.jf_DetailsList{
				width:1020px;
				margin-left:115px;
			}
			.form-inline .form-group{
				margin-right:25px;
			}
			.jf_ZhaoPian{
				position:absolute;
			}
			.jf_label{
				width:126px;
			}
			 .zhuanYe{
			 	width: 126px;
			    display: inline-block;
			    padding-left: 50px;
			 }
			 .jf_ZtLaber .jf_ZtBox{
				position:absolute;
			 	left:126px !important;
			 	top:39px !important;
			 } 
		</style> 
		<script type="text/javascript">
              var _basepath = "${basepath}";
              var _imgsrc="${pd.TOUXIANG}";
        </script>
	</head>
	<body>
				<div class="jf_ZhaoPian">
					<img src="" alt="" width="100%;" id="touxiang" style="width:99px;height:133px;"/>
					<a href="javascript:void(0);" id="btn_tx"><div class="jf_ImgUploading"><p>上传照片</p></div></a>
					<c:if test="${pd.PKID!=null}" >
					    <a href="javascript:void(0);" class="btn btn-danger" style="margin-top: 15px;" id="btn_resetpwd">初始化密码</a>
					</c:if>
					
				</div>
				<div class="jf_DetailsList">
					<div class="panel panel-info">
						<div class="jf_PanelHead panel-heading">
							<div class="jf_PanelTitle panel-title">
								个人信息
							</div>
						</div>
						<div class="panel-body" >
							<div class="form-inline">
								<div class="form-group">
									<label class="jf_label jf_xing">身份证：</label>
									<input type="text" name="" id="sfz" class="form-control" placeholder="请输入内容" value="${pd.SHENFENZHENGHAO}" maxlength="25"/>
								</div>
								
								<div class="form-group">
									<label class="jf_label jf_xing">出生日期：</label>
									<input type="text" name="" id="csrq" class="form-control" placeholder="请输入内容" readonly = "readonly" value="${pd.CHUSHENGRIQI}" maxlength="25"/>
								</div>
								<div class="form-group">
									<label class="jf_label jf_xing" for="">性别：</label>
									<input type="text" name=""  id="xingbie" class="form-control" placeholder="请输入内容"  readonly = "readonly" value="${pd.XINGBIE}" />
								</div>
							</div>
							<div class="form-inline">
								<div class="form-group">
									<label class="jf_label jf_xing" >姓名：</label>
									<input type="text" name="" id="name" class="form-control" placeholder="请输入内容" value="${pd.XINGMING}" maxlength="25"/>
								</div>
								<div class="form-group">
									<label class="jf_label jf_xing" for="">联系电话：</label>
									<input type="text" name="" id="phone" class="form-control" placeholder="请输入内容" value="${pd.SHOUJI}"maxlength="100"/>
								</div>
								<div class="form-group">
									<label class="jf_label jf_xing" for="">民族：</label>
	                                <select name="" class="form-control" id="minzu" placeholder="请输入内容" style="width:183px;">
                                  		  	<c:forEach items="${minzuList}" var="var">
                                  				<option value="${var.DICTIONARIES_ID }" <c:if test="${var.NAME == '汉族' }">selected</c:if>>${var.NAME }</option>
                                  			</c:forEach>
	                        		</select>
								</div>								
								<!-- 有用 勿删 -->
								<div style="display:none;">
									<input type="text" name="" id="pkid" class="form-control"  value="${pd.PKID }"/>
								</div>
								<!--end 有用 勿删 -->
							</div>
							<div class="form-inline">
								
								<div class="form-group">
									<label class="jf_label" for="">政治面貌：</label>
	                                <select name="" class="form-control" id="zhengzhimianmao" placeholder="请输入内容" style="width:183px;">
	                                    <option value="">请选择政治面貌</option>
	                                  	<c:forEach items="${zzmmList}" var="var">
	                                  		<option value="${var.DICTIONARIES_ID}" <c:if test="${var.DICTIONARIES_ID == pd.ZHENGZHIMIANMAO_PKID}">selected</c:if>>${var.NAME}</option>
	                                  	</c:forEach>
	                        		</select>
								</div>								
								<div class="form-group">
									<label class="jf_label" for="">健康状态：</label>
	                                <select name="" class="form-control" id="jkzk" placeholder="请输入内容" style="width:183px;">
	                                <option value="">请选择健康状态</option>
	                                  	<c:forEach items="${jkzkList}" var="var">
	                                  		<option value="${var.DICTIONARIES_ID}" <c:if test="${var.DICTIONARIES_ID == pd.JKZK_PKID}">selected</c:if>>${var.NAME}</option>
	                                  	</c:forEach>
	                        		</select>
								</div>								
								<div class="form-group">
									<label class="jf_label" for="">户口性质：</label>
	                                <select name="" class="form-control" id="hukouxingzhi" placeholder="请输入内容" style="width:183px;">
	                                <option value="">请选择户口性质</option>
	                                  	<c:forEach items="${hkxzList}" var="var">
	                                  		<option value="${var.DICTIONARIES_ID}" <c:if test="${var.DICTIONARIES_ID == pd.HUKOUXINGZHI_PKID}">selected</c:if>>${var.NAME}</option>
	                                  	</c:forEach>
	                        		</select>
								</div>								
							</div>
							<div class="form-inline">
								<div class="form-group">
									<label class="jf_label">邮政编码：</label>
									<input type="text" name="" id="yzbm" class="form-control" placeholder="请输入内容" value="${pd.YOUZHENGBIANMA}" maxlength="25"/>
								</div>
								
								<div class="form-group">
									<label class="jf_label">家庭成员姓名：</label>
									<input type="text" name="" id="jtcyxm" class="form-control" placeholder="请输入内容" value="${pd.JTCYXM}" maxlength="25"/>
								</div>
								<div class="form-group">
									<label class="jf_label" for="">家庭成员联系电话：</label>
									<input type="text" name="" id="lxdh"  class="form-control" placeholder="请输入内容" value="${pd.JTCYLXDH}" maxlength="25"/>
								</div>
							</div>
							<div class="form-inline">
								<div class="form-group">
									<label class="jf_label" for="">家庭关系：</label>
	                                <select name="" class="form-control" id="jtcygx" placeholder="请输入内容" style="width:183px;">
	                                <option value="">请选择家庭关系</option>
	                                  	<c:forEach items="${jtgxList}" var="var">
	                                  		<option value="${var.DICTIONARIES_ID}" <c:if test="${var.DICTIONARIES_ID == pd.JTCYGX_PKID}">selected</c:if>>${var.NAME}</option>
	                                  	</c:forEach>
	                        		</select>
								</div>
								<div class="form-group">
									<label class="jf_label jf_xing" for="">家庭地址：</label>
									<input type="text" name="" id="jiatingzhuzhi" class="form-control" placeholder="请输入内容" value="${pd.JIATINGZHUZHI}" style="width:498px  !important;"/>
								</div>
							</div>
							<div class="form-inline">								
								<div class="form-group">
									<label class="jf_label" for="">学号：</label>	                            
	                        		<input type="text" name="" id="xuehao" class="form-control" placeholder="请输入内容" value="${pd.XUEHAO}"/>
								</div>								
								<div class="form-group">
									<label class="jf_label" for="">是否贫困：</label>
	                                <select name="" class="form-control" id="poorstu" placeholder="请输入内容" style="width:183px;">
	                                <option value="">请选择是否贫困</option>
	                                  	<c:forEach items="${sfpkList}" var="var">
	                                  		<option value="${var.DICTIONARIES_ID}" <c:if test="${var.DICTIONARIES_ID == pd.POOR_PKID}">selected</c:if>>${var.NAME}</option>
	                                  	</c:forEach>
	                        		</select>
								</div>								
								<div class="form-group">
									<label class="jf_label jf_xing" for="">中学名称：</label>
									<input type="text" name="" id="zxmc" class="form-control" placeholder="请输入内容" value="${pd.ZXMC}"/>
								</div>								
							</div>
							<div class="form-inline">								
								<div class="form-group">
									<label class="jf_label" for="">考生号：</label>	                            
	                        		<input type="text" name="" id="kaoshenghao" class="form-control" placeholder="请输入内容" value="${pd.KAOSHENGHAO}"/>
								</div>								
								<div class="form-group" style="margin-top:10px;">
									<label class="jf_label" for="">考生特长：</label>
									<c:forEach items="${kstcList}" var="var"> 
										<input type="checkbox" name="checkbox" value="${var.BIANMA}"/> ${var.NAME}
									</c:forEach>																	
								</div>
								<div class="form-group" style="margin-top:10px;">
									<label class="jf_label" for="">特殊标记：</label>
									<c:forEach items="${stu_FlagList}" var="stuFlag"> 
										<input type="checkbox" name="checkbox1" value="${stuFlag.BIANMA}"/> ${stuFlag.NAME}
									</c:forEach>	
																
								</div>							
							</div>
					</div>
				</div>
				<div class="panel panel-info">
						<div class="jf_PanelHead panel-heading">
							<div class="jf_PanelTitle panel-title">
								学生信息
							</div>
						</div>
						<div class="panel-body">
							<div class="form-inline">								
								<div class="form-group">
									<label class="jf_label jf_xing">入学年份：</label>
                                    <select name="" <c:if test="${pd.PKID!=null}" >disabled="disabled"</c:if> class="form-control" id="grade" style="width:183px;">
                                    	<option value="">请选择入学年份</option>
                                    	<c:choose> 
                                    		  <c:when test="${pd.NIANJI!=null}"> 
                                    		  	<c:forEach items="${gradelist}" var="grade">
                                    				<option value="${grade.DICTIONARIES_ID }" bianma="${grade.BIANMA}" <c:if test="${grade.BIANMA == pd.NIANJI }">selected</c:if>>${grade.NAME }</option>
                                    			</c:forEach>
                                    		  </c:when>
                                    		  <c:otherwise>
                                    		  	<c:forEach items="${gradelist}" var="grade">
                                    				<option value="${grade.DICTIONARIES_ID }" bianma="${grade.BIANMA}" <c:if test="${grade.BIANMA == '18级' }">selected</c:if>>${grade.NAME }</option>
                                    			</c:forEach>
                                    		  </c:otherwise>
                                    	
                                    	</c:choose>
                                    	
			                        </select>
								</div>								
								<div class="form-group">
									<label class="jf_label" for="">录取专业：</label>
									<input type="text" name="" id="luquzhuanye"  class="form-control" placeholder="请输入内容" value="${pd.MATRICULATE_PROFESSION}"/>
								</div>								
								<%-- <div class="form-group">
									<label class="jf_label jf_xing" for="">院校专业：</label>
									<input type="text" name="" id="departmentid" class="form-control" placeholder="请输入内容" value="${pd.DEPARTMENT_PKID}"/>
								</div> --%>
								<div class="form-group" style="margin-left:5px;">
					                 <div class="zTreeDemoBackground left ">
										<ul class="list" style="margin-bottom:0;">
											<li class="jf_ZtLaber title"><span class="jf_xing zhuanYe">院校专业：</span><input class="form-control" id="citySel" type="text" <c:if test="${pd.PKID!=null}" >disabled="disabled"</c:if> readonly value="${pd.ZUZHINAME }" style="width:183px;" onclick="showMenu();" />
												<div id="menuContent" class="menuContent jf_ZtBox" style="display:none; position: absolute;left:126px !important;top:3px !important; z-index:1;">
													<ul id="treeDemo" class="ztree" style="margin-top:0; max-height: 300px;overflow:auto;"></ul>
												</div>
											</li>
										</ul>
									</div>
									<div style="display:none;">
								        <!--用来存储 树节点的id -->
									    <input type="text" name="tree" id="orgtree" class="form-control" value="${pd.DEPARTMENT_PKID}"/>
								    </div>
						        </div>								
						  </div>
						  <div class="form-inline">
								<div class="form-group">
								<label class="jf_label jf_xing" for="">学生类型：</label>
								<select name=""<c:if test="${pd.PKID!=null}" >disabled="disabled"</c:if> class="form-control" id="CENGCI" placeholder="请输入内容" style="width:183px;">
								        <option value="">请选择学生类型</option>
	                                 	<c:forEach items="${cengci_list}" var="var">
	                                 		<option value="${var.PKID}" <c:if test="${var.PKID == pd.CENGCI_PKID}">selected</c:if>>${var.CENGCI_NAME}</option>
	                                 	</c:forEach>
	                       		</select>
								</div>
								<div class="form-group">
									<label class="jf_label jf_xing" for="">批次：</label>
		                               <select name=""<c:if test="${pd.PKID!=null}" >disabled="disabled"</c:if> class="form-control" id="PICI" placeholder="请输入内容" style="width:183px;">
		                                 	<option value="">请选择批次</option>
		                                 	<c:forEach items="${pici_list}" var="var">
		                                 		<option value="${var.PKID}" <c:if test="${var.PKID == pd.PICI_PKID}">selected</c:if>>${var.PICI_NAME}</option>
		                                 	</c:forEach>
		                       		</select>
								</div>							
								<div class="form-group">
									<label class="jf_label" for="">投档成绩：</label>
									<input type="text" name="" id="toudangchengji" class="form-control" placeholder="请输入内容" value="${pd.TOUDANGCHENGJI}"/>
								</div>								
						  </div>
						  <div class="form-inline">
								
								<div class="form-group">
									<label class="jf_label" for="">学制：</label>
	                                <select name="" class="form-control" id="xuezhi" placeholder="请输入内容" style="width:183px;">
	                                <option value="">请选择学制</option>
	                                  	<c:forEach items="${cengci_list}" var="var">
	                                  		<option value="${var.PKID}" <c:if test="${var.PKID == pd.XUEZHI_PKID}">selected</c:if>>${var.XUENIANZHI}</option>
	                                  	</c:forEach>
	                        		</select>
								</div>								
								<div class="form-group">
									<label class="jf_label jf_xing" for="">科别：</label>
	                                <select name="" class="form-control" id="kebie" placeholder="请输入内容" style="width:183px;">
	                                <option value="">请选择科别</option>
	                                  	<c:forEach items="${keleiList}" var="var">
	                                  		<option value="${var.DICTIONARIES_ID}" <c:if test="${var.DICTIONARIES_ID == pd.KELEI_PKID}">selected</c:if>>${var.NAME}</option>
	                                  	</c:forEach>
	                        		</select>
								</div>								
								<div class="form-group">
									<label class="jf_label" for="">学籍类型：</label>
	                                <select name="" class="form-control" id="SCHOOLROLL" placeholder="请输入内容" style="width:183px;">
	                                <option value="">请选择学籍类型</option>
	                                  	<c:forEach items="${schoolrollList}" var="var">
	                                  		<option value="${var.DICTIONARIES_ID}" <c:if test="${var.DICTIONARIES_ID == pd.XUEJI_PKID}">selected</c:if>>${var.NAME}</option>
	                                  	</c:forEach>
	                        		</select>
								</div>															
					    </div>
						<div class="form-inline">
								<div class="form-group">
									<label class="jf_label" for="">所在班级：</label>
									
									<select name="" class="form-control" id="banji" placeholder="请输入内容" style="width:183px;">
										<option value=''>请选择班级</option>	                                  	
                                  		<c:forEach items="${banJiList}" var="var">
	                                  		<option <c:if test="${pd.BJ_PKID==var.PKID}">selected="selected"</c:if> value="${var.PKID}" >${var.CLASS_NAME}</option>
                                  		</c:forEach>                                 	
	                        		</select>
								</div>							
								<div class="form-group">
									<label class="jf_label jf_xing" for="">在学状态：</label>
			                        <input type="hidden" name="" id="zaixuezhuangtai" class="form-control" placeholder="请输入内容" value="ZX"/>
			                        <input type="text" name="" id="zxzt" class="form-control" readonly="readonly" placeholder="请输入内容" value="在学"/>
								</div>								
								<div class="form-group">
									<label class="jf_label" for="">升学标识：</label>
	                                <select name="" class="form-control" id="sxbs" placeholder="请输入内容" style="width:183px;">
	                                <option value=''>请选择升学标识</option>	 
	                                  	<c:forEach items="${sxbsList}" var="var">
	                                  		<option value="${var.DICTIONARIES_ID}" <c:if test="${var.DICTIONARIES_ID == pd.SHENGXUEBIAOSHI_PKID}">selected</c:if>>${var.NAME}</option>
	                                  	</c:forEach>
	                        		</select>
								</div>															
					    </div>
						<div class="form-inline">
							<div class="form-group">
									<label class="jf_label jf_xing" for="">学生类型：</label>
	                                <select name="" class="form-control" id="xueshengleixing" placeholder="请输入内容" style="width:183px;">
	                                    <option value="">请选择学生类型</option>
	                                  	<c:forEach items="${schoolrollList}" var="var">
	                                  		<option value="${var.DICTIONARIES_ID}" >${var.NAME}</option>
	                                  	</c:forEach>
	                        		</select>
							</div>	
							<div class="form-group">
 								<label class="jf_label">注册学籍时间：</label> 
 								<input class="span10 date-picker form-control" name="ZCXJSJ" placeholder="请选择内容" id="ZCXJSJ"  value="${pd.ZCXJSJ}" type="text" 
 								data-date-format="yyyy-mm-dd" readonly="readonly" style="width:170px;height: 35px;cursor:pointer;"  title="注册学籍时间"/>
						    </div>
							<div class="form-group">
								<input type="hidden" name="" id="xuejizhuangtai" class="form-control" placeholder="请输入内容"/>
								<label class="jf_label jf_xing" for="">计划性质：</label>
                                <select name=""  class="form-control" id="jihuaxingzhi" <c:if test="${pd.isEdit == 'isEdit'}">disabled="disabled"</c:if> placeholder="请输入内容" style="width:183px;">                                   	
                                	<option value="2" >计划外</option>   
                                	<option value="1" >计划内</option>                                	                               	
		                        </select>
							</div>															
					    </div>
						<div class="form-inline">							
						    	
							<div class="form-group">
 								<label class="jf_label">入学时间：</label> 
 								<input class="span10 date-picker form-control" name="RUXUESHIJIAN" placeholder="请选择内容" id="RUXUESHIJIAN"  value="${pd.RUXUESHIJIAN}" type="text" 
 								data-date-format="yyyy-mm-dd" readonly="readonly" style="width:170px;height: 35px;cursor:pointer;"  title="入学时间"/>
						    </div>														
					    </div>
				  </div>
			  </div>
			  <div class="panel panel-info">
						<div class="jf_PanelHead panel-heading">
							<div class="jf_PanelTitle panel-title">
								备注信息
							</div>
						</div>
						<div class="panel-body">
							<div class="form-inline" style="margin-bottom: 15px;">
								<div class="form-group">
	 								<label class="jf_label">备注1：</label> 
	 								<input type="text" name="" id="REMARKS1" class="form-control" placeholder="请输入内容" value="${pd.REMARKS1}" style="width:825px  !important;"/>
							    </div>															
						    </div>
							<div class="form-inline" style="margin-bottom: 15px;">
								<div class="form-group">
	 								<label class="jf_label">备注2：</label> 
	 								<input type="text" name="" id="REMARKS2" class="form-control"   maxlength="500"  placeholder="请输入内容" value="${pd.REMARKS2}" style="width:825px  !important;"/>
							    </div>															
						    </div>
							<div class="form-inline" style="margin-bottom: 15px;">
								<div class="form-group">
	 								<label class="jf_label">备注3：</label> 
	 								<input type="text" name="" id="REMARKS3" readonly="readonly"    maxlength="500" class="form-control" placeholder="请输入内容" value="${pd.REMARKS3}" style="width:825px  !important;"/>
							    </div>															
						    </div>
							<div class="form-inline" style="margin-bottom: 15px;">
								<div class="form-group">
	 								<label class="jf_label">备注4：</label> 
	 								<input type="text" name="" id="REMARKS4" readonly="readonly"    maxlength="500" class="form-control" placeholder="请输入内容" value="${pd.REMARKS4}" style="width:825px  !important;"/>
							    </div>															
						    </div>
							<div class="form-inline" style="margin-bottom: 15px;">
								<div class="form-group">
	 								<label class="jf_label">备注5：</label> 
	 								<input type="text" name="" id="REMARKS5" readonly="readonly"    maxlength="500" class="form-control" placeholder="请输入内容" value="${pd.REMARKS5}" style="width:825px  !important;"/>
							    </div>															
						    </div>
							<div class="form-inline" style="margin-bottom: 15px;">
								<div class="form-group">
	 								<label class="jf_label">备注6：</label> 
	 								<input type="text" name="" id="REMARKS6" readonly="readonly"    maxlength="500" class="form-control" placeholder="请输入内容" value="${pd.REMARKS6}" style="width:825px  !important;"/>
							    </div>															
						    </div>
							<div class="form-inline" style="margin-bottom: 15px;">
								<div class="form-group">
	 								<label class="jf_label">备注7：</label> 
	 								<input type="text" name="" id="REMARKS7" readonly="readonly"    maxlength="500" class="form-control" placeholder="请输入内容" value="${pd.REMARKS7}" style="width:825px  !important;"/>
							    </div>															
						    </div>
							<div class="form-inline" style="margin-bottom: 15px;">
								<div class="form-group">
	 								<label class="jf_label">备注8：</label> 
	 								<input type="text" name="" id="REMARKS8" readonly="readonly"    maxlength="500" class="form-control" placeholder="请输入内容" value="${pd.REMARKS8}" style="width:825px  !important;"/>
							    </div>															
						    </div>
					    </div>
					</div>
			
			<div class="clearfix"></div>
			<div class="panel panel-info">
				<div class="modal-footer">
					<button class="btn btn-danger" id="btn_save">保存</button>
					<button class="btn btn-default" data-dismiss="modal" id="btn_cancel">返回</buttom>
				</div>
			</div>
	</body>
	
	<script type="text/javascript">
	
		var zNodes=new Array();
	
		<c:forEach items="${zuzhilist}" var="t">  
			var a={id:'${t.DEPARTMENT_ID}',pId:'${t.PARENT_ID}',name:'${t.NAME}'};
			zNodes.push(a); //js中可以使用此标签，将EL表达式中的值push到数组中  
		</c:forEach>
			
			
		var stu_PersonalFlag=new Array();
		<c:forEach items="${stu_PersonalFlagList}" var="t">  
			var a={EXCEPTIONAL:'${t.EXCEPTIONAL}'};
			stu_PersonalFlag.push(a); //js中可以使用此标签，将EL表达式中的值push到数组中  
		</c:forEach>
	
		var requrl="${requrl}"	
  		function changeGrade(){
			$("#banji").html("");
			//根据院校专业、入学年份筛选班级的数据
			var nodeId = $('#orgtree').val();
			
			var grade=$('#grade').val();
			$.post(_basepath+"stuinfo/getBanJiByUse.json",{SYS_DICTIONARIES_PKID:grade,SYS_DEPARTMENT_PKID:nodeId},function(data){
				var banJiList=data.banJiList;
				var opt_str="<option value=''>请选择班级...</option>";
				for(i in banJiList ){
					opt_str+="<option value=\'"+banJiList[i].PKID+"\'>"+banJiList[i].CLASS_NAME+"</option>";
				}
				$("#banji").append(opt_str)
			});
	
	    }
	
	</script>
	<script type="text/javascript" src="${basepath}static/js/myjs/stu_ztree1.js"></script>
	<script type="text/javascript" src="${basepath}static/js/myjs/stu_ztree2.js"></script>
	<script type="text/javascript" src="${basepath}static/js/myjs/addcaijingstu.js"></script>
</html>
