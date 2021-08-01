<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<div id="sidebar"
     class="sidebar responsive sidebar-fixed"
     data-sidebar="true" data-sidebar-scroll="true"
     data-sidebar-hover="true">
    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'fixed')
        } catch (e) {
        }
    </script>

    <!-- /.sidebar-shortcuts -->

    <div class="nav-wrap-up pos-rel">
        <div class="nav-wrap">
            <div style="position: relative; top: 0px; transition-property: top; transition-duration: 0.15s;">
                <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                    <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                        <button class="btn btn-success">
                            <i class="ace-icon fa fa-signal"></i>
                        </button>

                        <button class="btn btn-info">
                            <i class="ace-icon fa fa-pencil"></i>
                        </button>

                        <button class="btn btn-warning">
                            <i class="ace-icon fa fa-users"></i>
                        </button>

                        <button class="btn btn-danger">
                            <i class="ace-icon fa fa-cogs"></i>
                        </button>
                    </div>
                    <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                        <span class="btn btn-success"></span> <span class="btn btn-info"></span>

                        <span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
                    </div>
                </div>
                <ul class="nav nav-list">
                    <li class="active"><a href="<c:url value ='/admin/home'/>"> <i
                            class="menu-icon fa fa-tachometer"></i> <span class="menu-text">
								Trang chủ </span>
                    </a> <b class="arrow"></b></li>
                    <li class=""><a class="dropdown-toggle"> <i
                            class="menu-icon fa fa-desktop"></i> <span class="menu-text">
								Quản lý sản phẩm </span> <b class="arrow fa fa-angle-down"></b>
                    </a> <b class="arrow"></b>

                        <ul class="submenu">
                            <li class="">
                                <c:url var="listNews" value="/admin/product/list">
                                    
                                    <%-- <c:param name="page" value="1"/>
                                    <c:param name="limit" value="2"/> --%>
                                  <%--   <c:param name="sortName" value="title"/>
                                    <c:param name="sortBy" value="asc"/> --%>
                                </c:url>
                                <a href="${listNews}"> <i
                                        class="menu-icon fa fa-caret-right"></i> Danh sách sản phẩm
                                </a> <b class="arrow"></b></li>
                        </ul>
                    </li>

                    <li class=""><a href="#" class="dropdown-toggle"> <i
                            class="menu-icon fa fa-list"></i> <span class="menu-text">
								Quản lý danh mục </span> <b class="arrow fa fa-angle-down"></b>
                    </a> <b class="arrow"></b>

                        <ul class="submenu">
                            <li class=""><a href="/admin/category/list"> <i
                                    class="menu-icon fa fa-caret-right"></i> Danh sách danh mục
                            </a> <b class="arrow"></b></li>
                        </ul>
                    </li>

                    <li class=""><a href="#" class="dropdown-toggle"> <i
                            class="menu-icon fa fa-pencil-square-o"></i> <span
                            class="menu-text"> Quản lý tài khoản </span> <b
                            class="arrow fa fa-angle-down"></b>
                    </a> <b class="arrow"></b>

                        <ul class="submenu">
                            <li class=""><a href="/admin/account/list"> <i
                                    class="menu-icon fa fa-caret-right"></i> Danh sách tài khoản
                            </a> <b class="arrow"></b></li>
                        </ul>
                    </li>

                    <li class=""><a href="/admin/order"> <i
                            class="menu-icon fa fa-list-alt"></i> <span class="menu-text">
								Hoá đơn </span>
                    </a> <b class="arrow"></b></li>


                    <li class=""><a href="/admin/Statistical"> <i
                            class="menu-icon fa fa-picture-o"></i> <span class="menu-text">
								Thống kê </span>
                    </a> <b class="arrow"></b></li>
                </ul>
            </div>
        </div>
        <div class="ace-scroll nav-scroll scroll-disabled">
            <div class="scroll-track" style="display: none;">
                <div class="scroll-bar"
                     style="top: 0px; transition-property: top; transition-duration: 0.1s;"></div>
            </div>
            <div class="scroll-content" style="">
                <div></div>
            </div>
        </div>
    </div>
    <!-- /.nav-list -->

    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse"
         style="z-index: 1;">
        <i class="ace-icon fa fa-angle-double-left"
           data-icon1="ace-icon fa fa-angle-double-left"
           data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>

    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'collapsed')
        } catch (e) {
        }
    </script>
</div>