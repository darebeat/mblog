<#-- Layout -->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <!--
    ------------------------------------------------------
     _____ ______   ________  ___       ________  ________
    |\   _ \  _   \|\   __  \|\  \     |\   __  \|\   ____\
    \ \  \\\__\ \  \ \  \|\ /\ \  \    \ \  \|\  \ \  \___|
     \ \  \\|__| \  \ \   __  \ \  \    \ \  \\\  \ \  \  ___
      \ \  \    \ \  \ \  \|\  \ \  \____\ \  \\\  \ \  \|\  \
       \ \__\    \ \__\ \_______\ \_______\ \_______\ \_______\
        \|__|     \|__|\|_______|\|_______|\|_______|\|_______|
    ------------------------------------------------------------
    version: ${site.version}
    github : https://github.com/langhsu/mblog
    ------------------------------------------------------------
    -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--[if IE]>
    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'/>
    <![endif]-->

    <@layout.block name="title">
        <title>${options['site_name']}</title>
    </@layout.block>

    <@layout.block name="keywords">
        <meta name="keywords" content="mtons, ${options['site_keywords']}">
    </@layout.block>

    <@layout.block name="keywords">
        <meta name="description" content="${options['site_description']}">
    </@layout.block>

    <meta name="mtons:mblog" content="${site.version}">

    ${options['site_metas']}

    <link href="${base}/dist/vendors/pace/themes/pace-theme-minimal.css" rel="stylesheet"/>
    <link href="${base}/dist/vendors/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

    <link href="${base}/dist/css/editor.css" rel="stylesheet"/>
    <link href="${base}/dist/css/plugins.css" rel="stylesheet"/>
    <link href="${base}/theme/classic/dist/css/style.css" rel="stylesheet"/>
    <link href="${base}/theme/classic/dist/css/swiper-bundle.min.css" rel="stylesheet"/> 

    <link href="${base}/dist/vendors/simple-line-icons/css/simple-line-icons.css" rel="stylesheet"/>
    <link href="${base}/dist/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>

    <script src="${base}/dist/vendors/pace/pace.min.js"></script>

    <script src="${base}/dist/js/jquery.min.js"></script>
    <script src="${base}/dist/vendors/layer/layer.js"></script>
    <script src="${base}/dist/vendors/bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        var _MTONS = _MTONS || {};
        _MTONS.BASE_PATH = '${base}';
        _MTONS.LOGIN_TOKEN = '${profile.id}';
    </script>

    <script src="${base}/dist/js/sea.js"></script>
    <script src="${base}/dist/js/sea.config.js"></script>

    <!-- Favicons -->
    <link href="<@resource src=options['site_favicon']/>" rel="apple-touch-icon-precomposed" />
    <link href="<@resource src=options['site_favicon']/>" rel="shortcut icon" />

    <@layout.block name="head">
        <script src="${base}/dist/js/sea.js"></script>
        <script src="${base}/dist/js/sea.config.js"></script>
    </@layout.block>
</head>
<body>
    <!-- header -->
    <@layout.block name="header">
        <#include "/classic/inc/header.ftl"/>
    </@layout.block>
    <!-- /header -->

    <!-- content -->
    <div class="wrap">
        <!-- Main -->
        <div class="container">
            <!-- top -->
            <@contents featured=1  size=5>
                <#if  results.content?size gt 0>
                    <div class="row banner bg-animation">
                        <!-- 幻灯片 轮播图 ↓--->
                        <div class="swipers-slider">
                            <div class="swiper-container">
                                <div class="swiper-wrapper">
                                    <#list results.content as row>
                                        <div class="swiper-slide">
                                            <div class="banner-item col-xs-12 col-sm-12 col-md-12">
                                                <div class="index-banner-box"<#if row.thumbnail?? && row.thumbnail?length gt 0> style="background-image:url(<@resource src=row.thumbnail/>)"<#else> style="background-image:url(${base}/dist/images/spinner-overlay.png)"</#if>>
                                                    <a class="top" href="${base}/post/${row.id}">
                                                        <div class="overlay"></div>
                                                        <!--<div class="line"></div>-->
                                                        <div class="title">
                                                            <h3>
                                                                <i class="icon icon-fire"></i>
                                                                ${row.title?html}
                                                            </h3>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </#list>
                                </div>
                                <div class="swiper-pagination hidden-xs"></div>
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-button-next"></div>
                            </div>
                        </div>
                    </div>
                </#if>
            </@contents>
            <!-- top/end -->

            <@layout.block name="contents">
                <h2>Contents will be here</h2>
            </@layout.block>
        </div>
    </div>
    <!-- /content -->

    <!-- footer -->
    <@layout.block name="footer">
        <#include "/classic/inc/footer.ftl"/>
    </@layout.block>
</body>
</html>