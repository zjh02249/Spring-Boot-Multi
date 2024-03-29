<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>z77z后台管理系统 - 角色内容页</title>
    <link href="${basePath}/static/css/content-base.css" rel="stylesheet"/>
    <link href="${basePath}/static/css/jqgrid/ui.jqgrid.css" rel="stylesheet"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>角色管理</h5>
            <div class="ibox-tools">
                <a class="collapse-link"> <i class="fa fa-chevron-up"></i>
                </a>
            </div>
        </div>
        <div class="ibox-content">
            <div class="form-group">
                <button id="btnAdd" type="button" class="btn btn-primary "
                        onclick="addModel()">
                    <i class="fa fa-plus"></i>&nbsp;添加
                </button>
                <button id="btnEdit" type="button" class="btn btn-info "
                        onclick="editModel()">
                    <i class="fa fa-pencil"></i> 编辑
                </button>
                <button id="btnDel" type="button" class="btn btn-danger "
                        onclick="delData()">
                    <i class="fa fa-remove"></i>&nbsp;&nbsp;<span class="bold">删除</span>
                </button>
                <button id="btnEditPerssion" type="button" class="btn btn-rounded"
                        onclick="editPerssion()">
                    <i class="fa fa-magnet"></i>&nbsp;&nbsp;<span class="bold">赋予权限</span>
                </button>
                <button id="btnEditMenu" type="button" class="btn btn-rounded"
                        onclick="editMenu()">
                    <i class="fa fa-magnet"></i>&nbsp;&nbsp;<span class="bold">赋予菜单</span>
                </button>
            </div>

            <div class="form-group">
                <div class="input-group">
                    <input id="txtSearchKey" type="text" class="input form-control"
                           placeholder="搜索关键字"/> <span class="input-group-btn">
							<button id="btnSearch" class="btn btn btn-primary" type="button">
								<i class="fa fa-search"></i> 搜索
							</button>
						</span>
                </div>
            </div>

            <div class="jqGrid_wrapper">
                <table id="table_list"></table>
                <div id="pager_list"></div>
            </div>
        </div>
    </div>
</div>


<script src="${basePath}/static/js/content/base.js"></script>


<script src="${basePath}/static/js/content/list.js"></script>

<script>
    function addModel() {
        $("#btnAdd").button("loading");
        window.location.href = "${basePath}/role/editPage/add";
    }

    function editModel() {//编辑
        var row = JucheapGrid.GetData();
        if (row != null) {
            $("#btnEdit").button("loading");
            window.location.href = "${basePath}/role/editPage/" + row.id;
        } else {
            parent.layer.alert("请选择要编辑的数据");
        }
    }

   function editPerssion() {//编辑角色权限
       var row = JucheapGrid.GetData();
       if (row != null) {
           $("#btnEditPerssion").button("loading");
           window.location.href = "${basePath}/role/editRolePerssionPage/" + row.id;
       }else {
           parent.layer.alert("请选择要编辑的数据");
       }
   }
   function editMenu() {//编辑角色菜单
       var row = JucheapGrid.GetData();
       if (row != null) {
           $("#btnEditMenu").button("loading");
           window.location.href = "${basePath}/role/editRoleMenuPage/" + row.id;
       }else {
           parent.layer.alert("请选择要编辑的数据");
       }
   }


    function delData() {//删除
        XPage.DelData("${basePath}/role/delete");
    }

    function searchData() {//搜索
        var json = {
            keywords: $("#txtSearchKey").val()
        };
        XPage.Search(json);
    }

    $(document).ready(function () {
        var config = {
            title: '角色列表',
            url: '${basePath}/role/getRoleListWithPager',
            colNames: ['主键', '角色名称', '角色编号'],
            colModel: [{
                name: 'id',
                index: 'id',
                width: 60,
                key: true,
                hidden: true
            }, {
                name: 'name',
                index: 'name',
                width: 60
            }, {
                name: 'type',
                index: 'type',
                width: 100
            }]
        };
        JucheapGrid.Load(config);
        $("#btnSearch").bind("click", searchData);
    });

    if ('${edit!'false'}' == 'false') {
<#if edit??>
parent.layer.msg('保存失败，请重试！', {icon: 5, anim: 6, offset: 't'});
</#if>
    }


    if ('${edit!'false'}' == 'true') {
            <#if edit??>
                parent.layer.msg('保存成功！', {icon: 6, anim: 6, offset: 't'});
            </#if>
    }
</script>
</body>
</html>

