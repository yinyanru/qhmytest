//@ sourceURL=fbjf_ztree.js 
var setting = {
			check: {
				enable: true,
				chkStyle: "checkbox",
				chkboxType: { "Y": "s", "N": "ps" }
			},
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: onClick,
				onCheck: onCheck
			}
		};

//		var zNodes =[
//			{id:4, pId:0, name:"河北省", open:true, nocheck:true},
//			{id:41, pId:4, name:"石家庄"},
//			{id:42, pId:4, name:"保定"},
//			{id:43, pId:4, name:"邯郸"},
//			{id:44, pId:4, name:"承德"},
//			{id:5, pId:0, name:"广东省", open:true, nocheck:true},
//			{id:51, pId:5, name:"广州"},
//			{id:52, pId:5, name:"深圳"},
//			{id:53, pId:5, name:"东莞"},
//			{id:54, pId:5, name:"佛山"},
//			{id:6, pId:0, name:"福建省", open:true, nocheck:true},
//			{id:61, pId:6, name:"福州"},
//			{id:62, pId:6, name:"厦门"},
//			{id:63, pId:6, name:"泉州"},
//			{id:64, pId:6, name:"三明"}
//		 ];

		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}

		function onCheck(e, treeId, treeNode) {
			 $("#citySel").attr("value", "");
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			//var  nodeid=$("#orgtree").attr("value");
			nodeid="";
			//colleges_pkid="";
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
				nodeid+=nodes[i].id+",";
				//colleges_pkid+=colleges_pkid+",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			var cityObj = $("#citySel");
			cityObj.attr("value", v);
			$("#orgtree").attr("value", nodeid);
			//$("#orgtree2").attr("value", colleges_pkid);
		}

		function showMenu() {
			var cityObj = $("#citySel");
			var cityOffset = $("#citySel").offset();
			$("#menuContent").css({left:"0px", top:"34px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu2();
			}
		}

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
		
		