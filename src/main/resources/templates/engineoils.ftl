<#include "base.ftl">
<#import "/spring.ftl" as spring />

<#macro body>
<div id="breadcrumb">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/">Домой</a></li>
            <li class="active">Моторные масла</li>
        </ul>
    </div>
</div>


    <div class="container">
        <#if user?? && (user.appRole.name == "ROLE_CONTENTMANAGER" || user.appRole.name == "ROLE_MANAGER")>
            <div class="row" style="margin-bottom: 10px; ">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <a href="/contentmanager/engineoil/add" class="btn primary-btn btn-lg">Добавить новое моторное
                        масло</a>
                </div>
                <div class="col-md-4"></div>
            </div>
        </#if>

        <div class="row">
            <div id="aside" class="col-md-3" style="border-top: 1px solid #DADADA">
                <div class="aside">
                    <h3 class="aside-title">Фильтр по производителю</h3>
                    <form action="/engineoils" method="POST">
                        <div class="form-group">
                            <select name="filtr" class="custom-select">
                                <#if !filtr?? || filtr == "all">
                                    <option selected value="all">Все</option>
                                    <#list manafacturerlist as manafacturer>
                                        <option value="${manafacturer}">${manafacturer}</option>
                                    </#list>
                                <#else>
                                    <option value="all">Все</option>
                                    <#list manafacturerlist as manafacturer>
                                        <#if filtr == manafacturer>
                                            <option selected value="${manafacturer}">${manafacturer}</option>
                                        <#else>
                                            <option value="${manafacturer}">${manafacturer}</option>
                                        </#if>
                                    </#list>
                                </#if>
                            </select>
                        </div>
                        <button type="submit" class="btn primary-btn btn-lg">Вывод</button>
                    </form>
                </div>
            </div>


            <div id="main" class="col-md-9">
                <div id="store" style="margin-top: 0">
                    <div class="row">
                        <#list oillist as oil>
                            <div class="col-md-4 col-sm-6 col-xs-6">
                                <div class="product product-single">
                                    <div class="product-thumb">
                                        <img src="${oil.photoPath}" width="262.5" height="350" alt="">
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-price">₽${oil.price}</h3>
                                        <h2 class="product-name"><a href="#">${oil.name}</a></h2>
                                        <#if user?? && (user.appRole.name == "ROLE_CONTENTMANAGER" || user.appRole.name == "ROLE_MANAGER")>
                                            <div class="product-btns">
                                                <a style="display: inline-block;"
                                                   href="/contentmanager/engineoil/${oil.id}/"
                                                   class="btn primary-btn btn-sm crud_btn">Изменить</a>
                                                <form style="display: inline-block;"
                                                      action="/contentmanager/engineoil/${oil.id}/delete" method="post">
                                                    <input type="submit" class="btn primary-btn btn-sm crud_btn"
                                                           value="Удалить"/>
                                                </form>
                                            </div>
                                        </#if>
                                    </div>
                                </div>
                            </div>
                        </#list>
                    </div>

                    <div class="row">
                        <div class="col-md-5"></div>
                        <div class="col-md-2">
                            <a href="/engineoils/pdf"><i class="fa fa-file-text fa-3x" aria-hidden="true"></i></a>
                        </div>
                        <div class="col-md-5"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</#macro>

<@base_template />
