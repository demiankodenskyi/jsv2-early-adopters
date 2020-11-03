<script type="template/klevu" id="klevuQuickTemplateBase">
    <div class="klevu-fluid">
        <div id="klevuSearchingArea" class="klevuQuickSearchingArea">
        	<%=helper.render('klevuQuickPromotionBanner',scope) %>
            <div class="klevuSuggestionsBlock">
                <%=helper.render('klevuQuickAutoSuggestions',scope) %>
                <%=helper.render('klevuQuickPageSuggestions',scope) %>
                <%=helper.render('klevuQuickCategorySuggestions',scope) %>
            </div>
            <%=helper.render('klevuQuickProducts',scope) %>
            <%=helper.render('klevuTrendingProducts',scope) %>
            <%=helper.render('klevuRecentViewedProducts',scope) %>
        </div>
      </div>
</script>


<script type="template/klevu" id="klevuQuickAutoSuggestions">
    <% if(data.suggestions.autosuggestion) { %>
        <% if(data.suggestions.autosuggestion.length> 0 ) { %>
            <div class="klevuAutoSuggestionsWrap klevuAutosuggestions">
                <div class="klevuSuggestionHeading">
                    <span class="klevuHeadingText"> <%=helper.translate("Suggestions")%></span>
                </div>
                <ul>
                    <% helper.each(data.suggestions.autosuggestion,function(key,suggestion){ %>
                        <li><a target="_self" href="<%=helper.buildUrl(data.settings.landingUrl, 'q' , helper.stripHtml(suggestion.suggest))%>" data-content="<%=helper.stripHtml(suggestion.suggest) %>" class="klevu-track-click"> <%=suggestion.suggest %> </a></li>
                    <% }); %>
                </ul>
            </div>
        <% } %>
    <% } %>
</script>



<script type="template/klevu" id="klevuQuickPageSuggestions">
    <% if(data.query.cmsCompressed) { %>
        <% if(data.query.cmsCompressed.result.length > 0 ){ %>
            <div class="klevuAutoSuggestionsWrap klevuCmsSuggestions" id="klevuCmsContentArea">
                <div class="klevuSuggestionHeading"><span class="klevuHeadingText"><%=helper.translate("Pages")%></span></div>
                <ul>
                    <% helper.each(data.query.cmsCompressed.result,function(key,cms){ %>
                        <li><a target="_self" href="<%=cms.url%>" class="klevu-track-click" data-url="<%=cms.url%>" data-name="<%=cms.name%>"><%=cms.name%></a></li>
                    <% }); %>
                </ul>
            </div>
        <% } %>
    <% } %>
</script>



<script type="template/klevu" id="klevuQuickCategorySuggestions">
    <% if(data.query.categoryCompressed) { %>
        <% if(data.query.categoryCompressed.result.length > 0 ){ %>
            <div class="klevuAutoSuggestionsWrap klevuCategorySuggestions" id="klevuCategoryArea">
                <div class="klevuSuggestionHeading">
                    <span class="klevuHeadingText"><%=helper.translate("Category")%></span>
                </div>
                <ul>
                    <% helper.each(data.query.categoryCompressed.result,function(key,category){ %>
                        <li><a target="_self" href="<%=category.url%>" class="klevu-track-click" data-url="<%=category.url%>" data-name="<%=category.name%>" ><%=category.name%></a></li>
                    <% }); %>
                </ul>
            </div>
        <% } %>
    <% } %>
</script>



<script type="template/klevu" id="klevuQuickProducts">
    <% if(data.query.productList) { %>
        <% if(data.query.productList.result.length > 0 ) { %>
            <div class="klevuResultsBlock">
                <div class="klevuSuggestionHeading"><span class="klevuHeadingText"><%=helper.translate("Products")%></span></div>
                <div class="klevuQuickSearchResults" data-section="productList" id="productsList">
                    <div class="klevuProductsViewAll">
                        <a target="_self" href="<%=helper.buildUrl(data.settings.landingUrl,'q',helper.stripHtml(data.settings.term))%>" target="_parent"><%=helper.translate("View All")%></a>
                    </div>
                    <ul>
                      <% helper.each(data.query.productList.result,function(key,product){ %>
                          <%=helper.render('klevuQuickProductBlock',scope,data,product) %>
                      <% }); %>
                    </ul>
                </div>
            </div>
        <% } else { %>
            <%=helper.render('klevuQuickNoResultFound',scope) %>
        <% } %>
    <% } %>
</script>


<script type="template/klevu" id="klevuQuickProductBlock">
    <li class="klevuProduct" data-id="<%=dataLocal.id%>">
        <a target="_self" href="<%=dataLocal.url%>" data-id="<%=dataLocal.id%>"  class="klevuQuickProductInnerBlock trackProductClick kuTrackRecentView">
            <div class="klevuProductItemTop">
                <div class="klevuQuickImgWrap">
                    <div class="klevuQuickDiscountBadge"><strong><%=dataLocal.sku%></strong></div>
                    <img src="<%=dataLocal.image%>" alt="<%=dataLocal.name%>" />
                </div>
            </div>
            <div class="klevuProductItemBottom">
                <div class="klevuQuickProductDescBlock">
                    <div class="klevuQuickProductName"><%=dataLocal.name%></div>
                    <div class="klevuQuickProductDesc">
                        <div class="klevuSpectxt"><%=dataLocal.summaryAttribute%><span><%=dataLocal.stickyLabelText%></span></div>
                    </div>
                    <div class="klevuQuickProductPrice">
                        <% if(dataLocal.ondiscount && dataLocal.ondiscount == "true") { %>
                            <% if(dataLocal.salePrice ) { %>
                                <span class="klevuQuickSalePrice klevuQuickSpecialPrice">
                                    <%=helper.processCurrency(dataLocal.currency,parseFloat(dataLocal.salePrice))%>
                                </span>
                            <% } %>
                            <% if(dataLocal.price) { %>
                                <span class="klevuQuickOrigPrice"><%=helper.translate("Original price %s",helper.processCurrency(dataLocal.currency,parseFloat(dataLocal.price)))%></span>
                            <% } %>
                        <% } else { %>
                            <% if(dataLocal.salePrice ) { %>
                                <span class="klevuQuickSalePrice">
                                    <span class="klevuQuickPriceGreyText"></span>
                                    <%=helper.processCurrency(dataLocal.currency,parseFloat(dataLocal.salePrice))%>
                                </span>
                            <% } %>
                        <% } %>
                    </div>
                </div>
            </div>
            <div class="klevuClearLeft"></div>
        </a>
        <%=helper.render('quickSearchProductAddToCart',scope,data,dataLocal) %>
    </li>
</script>


<script type="template/klevu" id="klevuQuickNoResultFound">
    <div class="klevuQuickNoResults">
        <div class="klevuQuickNoResultsInner">
            <div class="klevuQuickNoResultsMessage">We're Sorry, No result found for term '<span><%=data.settings.termOriginal%></span>'.</div>          
        </div>
    </div>
</script>


<!-- 
    Quick search add to cart button template
-->

<script type="template/klevu" id="quickSearchProductAddToCart">
    <div class="klevuQuickAddtoCart" data-id="<%=dataLocal.id%>" >
        <button class="klevuQuickCartBtn">Add to Cart</button>
    </div>
</script>

<!-- Product block template for Trending products in Quick Search Results -->

<script type="template/klevu" id="klevuQuickTrendingProductBlock">
    <li class="klevuProduct kuQSMenuItem" data-id="<%=dataLocal.id%>">
        <a target="_self" href="<%=dataLocal.url%>" data-id="<%=dataLocal.id%>" class="klevuQuickProductInnerBlock trackProductClick kuQSMenuItemTarget">
            <div class="klevuProductItemTop">
                <div class="klevuQuickImgWrap">
                    <div class="klevuQuickDiscountBadge"><strong><%=dataLocal.stickyLabelHead%></strong></div>
                    <img src="<%=dataLocal.image%>" alt="<%=dataLocal.name%>" />
                </div>
            </div>
            <div class="klevuProductItemBottom">
                <div class="klevuQuickProductDescBlock">
                    <div class="klevuQuickProductName"><%=dataLocal.name%></div>
                    <div class="klevuQuickProductDesc">
                        <div class="klevuSpectxt"><%=dataLocal.summaryAttribute%><span><%=dataLocal.stickyLabelText%></span></div>
                    </div>
                    <div class="klevuQuickProductPrice">
                        <% if(dataLocal.ondiscount && dataLocal.ondiscount == "true") { %>
                            <% if(dataLocal.salePrice ) { %>
                                <span class="klevuQuickSalePrice klevuQuickSpecialPrice">
                                    <%=helper.processCurrency(dataLocal.currency,parseFloat(dataLocal.salePrice))%>
                                </span>
                            <% } %>
                            <% if(dataLocal.price) { %>
                                <span class="klevuQuickOrigPrice"><%=helper.translate("Original price %s",helper.processCurrency(dataLocal.currency,parseFloat(dataLocal.price)))%></span>
                            <% } %>
                        <% } else { %>
                            <% if(dataLocal.salePrice ) { %>
                                <span class="klevuQuickSalePrice">
                                    <span class="klevuQuickPriceGreyText"></span>
                                    <%=helper.processCurrency(dataLocal.currency,parseFloat(dataLocal.salePrice))%>
                                </span>
                            <% } %>
                        <% } %>
                    </div>
                </div>
            </div>
            <div class="klevuClearLeft"></div>
        </a>
    </li>
</script>

<!-- Trending products template for Quick Search Results -->

<script type="template/klevu" id="klevuTrendingProducts">
    <% if(data.query.trendingProductList) { %>
        <% if(data.query.trendingProductList.result.length > 0 ) { %>
            <div class="klevuResultsBlock">
                <div class="klevuSuggestionHeading"><span class="klevuHeadingText"><%=helper.translate("Trending Products")%></span></div>
                <div class="klevuQuickSearchResults" data-section="trendingProductList" id="trendingProductList">
                    <ul>
                      <% helper.each(data.query.trendingProductList.result,function(key,product){ %>
                          <%=helper.render('klevuQuickTrendingProductBlock',scope,data,product) %>
                      <% }); %>
                    </ul>
                </div>
            </div>
        <% } %>
    <% } %>
</script>

<!--
Quick search results banner template
-->
<script type="template/klevu" id="klevuQuickPromotionBanner">
    <% if(data.banners && data.banners.length) { klevu.each(data.banners, function(index, banner){ %>
        <div class="klevu-banner-ad kuBannerContainer">
            <a 
            class="kuTrackBannerClick" 
            target="_self" 
            data-id="<%= banner.id %>" 
            data-name="<%= banner.name %>"
            data-image="<%= banner.src %>"
            data-redirect="<%= banner.click %>" 
            href="<%= banner.click %>">
                <img src="<%= banner.src %>" alt="<%= banner.name %>" />
            </a>
        </div>
    <% }); } %>
</script>

<!-- Product block template for Recently viewed products in Quick Search Results -->
<script type="template/klevu" id="klevuQuickRecentViewedProductBlock">
    <li class="klevuProduct kuQSMenuItem" data-id="<%=dataLocal.id%>">
        <a  target="_self" href="<%=dataLocal.url%>" data-id="<%=dataLocal.id%>" class="klevuQuickProductInnerBlock trackProductClick kuQSMenuItemTarget">
            <div class="klevuProductItemTop">
                <div class="klevuQuickImgWrap">
                    <div class="klevuQuickDiscountBadge"><strong><%=dataLocal.stickyLabelHead%></strong></div>
                    <img src="<%=dataLocal.image%>" alt="<%=dataLocal.name%>" />
                </div>
            </div>
            <div class="klevuProductItemBottom">
                <div class="klevuQuickProductDescBlock">
                    <div class="klevuQuickProductName"><%=dataLocal.name%></div>
                    <div class="klevuQuickProductDesc">
                        <div class="klevuSpectxt"><%=dataLocal.summaryAttribute%><span><%=dataLocal.stickyLabelText%></span></div>
                    </div>
                    <div class="klevuQuickProductPrice">
                        <% if(dataLocal.ondiscount && dataLocal.ondiscount == "true") { %>
                            <% if(dataLocal.salePrice ) { %>
                                <span class="klevuQuickSalePrice klevuQuickSpecialPrice">
                                    <%=helper.processCurrency(dataLocal.currency,parseFloat(dataLocal.salePrice))%>
                                </span>
                            <% } %>
                            <% if(dataLocal.price) { %>
                                <span class="klevuQuickOrigPrice"><%=helper.translate("Original price %s",helper.processCurrency(dataLocal.currency,parseFloat(dataLocal.price)))%></span>
                            <% } %>
                        <% } else { %>
                            <% if(dataLocal.salePrice ) { %>
                                <span class="klevuQuickSalePrice">
                                    <span class="klevuQuickPriceGreyText"></span>
                                    <%=helper.processCurrency(dataLocal.currency,parseFloat(dataLocal.salePrice))%>
                                </span>
                            <% } %>
                        <% } %>
                    </div>
                </div>
            </div>
            <div class="klevuClearLeft"></div>
        </a>
    </li>
</script>

<!-- Recent viewed products template for Quick Search Results -->

<script type="template/klevu" id="klevuRecentViewedProducts">
    <% if(data.query.recentViewedProductList) { %>
        <% if(data.query.recentViewedProductList.result.length > 0 ) { %>
            <div class="klevuResultsBlock">
                <div class="klevuSuggestionHeading">
                    <span class="klevuHeadingText"><%=helper.translate("Recently Viewed Products")%></span>
                </div>
                <div class="klevuQuickSearchResults" data-section="recentViewedProductList" id="recentViewedProductList">
                    <ul>
                      <% helper.each(data.query.recentViewedProductList.result,function(key,product){ %>
                          <%=helper.render('klevuQuickRecentViewedProductBlock',scope,data,product) %>
                      <% }); %>
                    </ul>
                </div>
            </div>
        <% } %>
    <% } %>
</script>