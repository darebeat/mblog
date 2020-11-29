<@layout.extends name="/inc/layout.ftl">

    <@layout.put block="contents">

        <div class="row">
            <div class="col-xs-12 col-md-9 side-left">
                <div class="posts">
                    <@contents pageNo=pageNo>
                    <ul class="posts-list">
                        <@layout.extends name="/inc/posts_item.ftl" />
                        <#list results.content as row>
                            <@posts_item row/>
                        </#list>
                        <#if  results.content?size == 0>
                            <li class="content">
                                <div class="content-box posts-aside">
                                    <div class="posts-item">该目录下还没有内容!</div>
                                </div>
                            </li>
                        </#if>
                    </ul>
                    </@contents>
                </div>
                <div class="text-center">
                    <!-- Pager -->
                    <@utils.pager request.requestURI!"", results, 5/>
                </div>
            </div>
            <div class="col-xs-12 col-md-3 side-right">
                <@layout.extends name="/inc/right.ftl" />
            </div>
        </div>
    </@layout.put>
</@layout.extends>