<html class=no-js lang=en xmlns:fb="http://www.facebook.com/2008/fbml"
	xmlns:og="http://ogp.me/ns#" itemscope
	itemtype="http://schema.org/Product">

<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.UnsupportedEncodingException"%>
<%@ page import="java.io.File"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="org.walmart.dto.AuthorInfo"%>
<%@ page import="driver.TopicManager"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="org.walmart.utils.FetchWalmartpage;"%>
<head>
<title>Walmart.com: Save money. Live better.</title>
<meta charset=utf-8>
<link href="http://i4.walmartimages.com/css/rollups/homePage.jsp"
	rel=stylesheet>
<script src="http://i4.walmartimages.com/js/rollups/pageTop.jsp"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<style>
a.morelink {
    text-decoration:none;
    outline: none;
}
.morecontent span {
    display: none;
}
.comment {
}
</style>
<script>
$(document).ready(function() {
    var showChar = 100;
    var ellipsestext = "...";
    var moretext = "more";
    var lesstext = "less";
    $('.more').each(function() {
        var content = $(this).html();
 
        if(content.length > showChar) {
 
            var c = content.substr(0, showChar);
            var h = content.substr(showChar-1, content.length - showChar);
 
            var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
 
            $(this).html(html);
        }
 
    });
 
    $(".morelink").click(function(){
        if($(this).hasClass("less")) {
            $(this).removeClass("less");
            $(this).html(moretext);
        } else {
            $(this).addClass("less");
            $(this).html(lesstext);
        }
        //$(this).parent().prev.parent.prev.toggle('slow');
    $(this).parent().prev().toggle();
        $(this).prev().toggle();
        return false;
    });
});
</script>
</head>

<body>
    <div id=wmHomePageWrapper></div> <!-- blue strip in first page -->

    <header class=wmHeader> <!-- formatting -->

    <span id=header-20 class=futureCustomer> 
        <section class="wmTopMainNav container">
        <article class="topMarketingMessage highlight span9"> 
        <a href="#" title="Sign up for emails, get money-saving offers">Sign up for emails, get money-saving offers</a></article> 
        
        
        <article class="wmUtilNav pull-right clearfix"> 
        <nav> 
        <ul class=nav>
	        <li class=listDropdown><a href="#" class=dropdown-toggle data-toggle=dropdown title="Gift Cards">Gift Cards</a><b class=arrow></b>
	        </li>
	        <li class=listDropdown><a href="#" class=dropdown-toggle data-toggle=dropdown title=Registry>Registry</a> <b class=arrow></b>
	        </li>
	        <li id=storeFinderDropdownId><a href="#" class=dropdown-toggle data-toggle=dropdown title="Store Finder">Store Finder</a><b class=arrow></b>
	        </li>
	        <li id=localAdDropdownId class=listDropdown><a href="#" class=dropdown-toggle data-toggle=dropdown title="Weekly Ad">Weekly Ad</a><b class=arrow></b>
	        </li>
	        <li id=trackOrdersDropdown class=listDropdown><a href="#" class=dropdown-toggle data-toggle=dropdown title="Track My Orders">Track My Orders</a><b class=arrow></b>
	        </li>
	        <li class=wmHelpLink><a href="#" title=Help>Help</a>
            </li>
        </ul>
        </nav>
        </article>
        </section>
	
        <section class=ribbon> 

        <article class="wmBottomMainNav container tabs-3 clearfix">
                                        
        <nav class="wmTabs topNav pull-left clearfix">
        <ul>
            <li class="homeTab activeTab"><a href="#" class=wmMainLogo title="Walmart. Save Money. Live Better."><img height=62 width=195 src="http://i3.walmartimages.com/images/Site/Categories/HomePage/2013/Week13/optimized/logo_b5c1050673bc2da31914928b3789793c.png"></a>
            </li>

	        <li class="trendingTab "><a href="#" title=Trending>
                <span class=line1>Trending</span>
                <span class="line2 light-blue">Now</span></a>
                <span id=trendingIndicator></span>
            </li>

            <li id=storeTab-12 class="myStoreTab ">
                <a href="#" class=defaultStore title="Your Store">
                    <span class=line1>Your Store</span><span class="line2 light-blue">Set It Now</span>
                </a>
                <a href="#" class=setStore title="My Store"><span class=line1>My Store</span>
                    <span class="line2 light-blue"></span>
                </a>
            </li>
        </ul>
        </nav>
        <form class=searchBox>
            <span class=add-on> 
                <select class=selectBox onchange="document.searchbox.search_constraint.value = this.options[this.selectedIndex].value">
                </select> 
            </span>
            <div id=TypeAhead class=yui-ac><input id=searchText value=Search onfocus="if (this.value.length) { this.value='';}" onblur="if (this.value=='') { this.value='Search';};" name=auth_search tabindex=1>
            </div>
            <input type=submit href="#" class="bigGoButton searchIcon" value=Go>
        </form>



    
        <article class=myAccountContainer style="margin-left:-100px">
        <nav class=wmTabs>
	
	    <div id="container" >
	
				
	    <%  String authorName = request.getParameter("auth_search"); %> 
        <% if(authorName != null && authorName.length() != 0) { %>
	    <%  String resStatus = null; 

            TopicManager objTP = null;
            AuthorInfo objAI = null;
            try {
                objTP = TopicManager.getInstance();
            } catch (FileNotFoundException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
             }
             String origsearch = authorName;
             if(authorName.equalsIgnoreCase("the racketeer")) {
                authorName = "John Grisham";
             }

             int id = objTP.getAuthorId(authorName);
             if(id != -1) {
                objAI = objTP.fetchAuthorInformation(id);
                resStatus = objAI.retStatus;
                String walPagename = FetchWalmartpage.getPagename(origsearch);

         %>

	
	    <div style="width:650px; float: left;"  ><br>
	        <h3 class="text-info">
	            <p>Results from Walmart:</p>
	        </h3>
	        <iframe src=<%=walPagename%> height=3000 width=600 frameborder="0" seamless scrolling="no">
		    </iframe>
		</div>

	
	    <div style="width: 350px; float: left; margin-left:50px">
	        <ol style="margin: 0px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 15px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
		        <div style="border: none; line-height: 1.24; margin-top: 15px; position: relative; padding: 0px 15px 15px; width: 424px; -webkit-box-shadow: rgba(0, 0, 0, 0.2) 0px 1px 4px; box-shadow: rgba(0, 0, 0, 0.2) 0px 1px 4px; margin-left: 2px;">
		            <div>
		                <div>


		                    <div aria-level="2" style="margin: 0px 0px 12px; padding: 9px 0px 0px;">


		                    <% if(objAI.getName() != null) {
			                    String imagePrefix = objAI.imagePrefix;
			                    String filename = "freebaseimages/" + imagePrefix + ".freebaseJson.1";
			                    //String filename = "freebaseAuthorImages/" + imagePrefix + ".freebasejson.1";
			                    boolean bExists = (new File("/scratch/pradap/local/share/topicpages/data/" + filename)).exists();
		                     %>
		                    <%if(bExists == true)	 {%>
		                        <div style="float: left; padding-right: 10px">
		                            <img src=<%=filename%> alt=<%=objAI.getName()[0] %> width="80" height="100">
		                        </div>
	    	                <%}%>

		                        <div>
		                            <div style="color: rgb(25, 71, 209); font-size: 30px; font-weight: normal;">
		                                <%=objAI.getName()[0] %>
		                            </div>
                                    <% String genrelinkprefix = "http://www.walmart.com/search/search-ng.do?search_constraint=3920&search_query="; %>
                                    <% 
                                        String thrillerlink = genrelinkprefix+"thriller+fiction";
                                        String mysterylink = genrelinkprefix+"suspense+mystery";
                                        String humorlink = genrelinkprefix+"humor";
                                        %>
                                    
                                        
                                        <% if(origsearch.equalsIgnoreCase("the racketeer")) {%>
		                                <div style=" margin-top: 0px; color: rgb(153, 153, 153); font-size: 13px; font-weight:500;margin-top: 2px;">
                                            <span style="padding-right: 5px;"> Author of The Racketeer </span> <br>
                                            <span style="padding-right: 5px;"> Genres: <a href=<%=thrillerlink%> target="_blank" title="Best selling books in Literature&Fiction genre"> Literature&Fiction </a>, <a href=<%=mysterylink%> target="_blank" title="Best selling books in Suspense&Mystery genre"> Suspense&Mystery  </a></span>
                                        </div>
                                        <%} else  {%>
		                                <div style=" margin-top: 4px; color: rgb(153, 153, 153); font-size: 13px; font-weight:500; margin-top: 2px;">
                                            <span style="padding-right: 5px;"> Genres: <a href=<%=thrillerlink%> target="_blank" title="Best selling books in Literature&Fiction genre"> Literature&Fiction </a>, <a href=<%=mysterylink%> target="_blank" title="Best selling books in Suspense&Mystery genre"> Suspense&Mystery, <a href=<%=humorlink%> title="Best selling books in Comedy genre" target="_blank"> Comedy </a></span>
                                        </div>
                                        <%}%>
		                        </div>
		
		                    <% } %>
                            <% if(objAI.getDescription() != null) {
                                String sDescription = objAI.getDescription()[0];  
                                int index = sDescription.indexOf(".");
                                ArrayList<Integer> indexVec = new ArrayList<Integer>();
                                while (index >= 0) {
                                    indexVec.add(index);
                                    index = sDescription.indexOf(".", index + 1); 
    
                                }   
                                int endIndex = 1;
                                String smallDesc ="";
    
                                while(smallDesc.length() < 25 && endIndex-1 < indexVec.size()) {
                                    endIndex = Math.min(indexVec.size(), endIndex);
                                    smallDesc = sDescription.substring(0, indexVec.get(endIndex-1)) + ".";
                                    endIndex ++; 
                                } 
                            
                            %>
		                        <div class="more"> 
                                    <%=smallDesc%>
                                 
		                        </div>


		                    <% } %>
                            <!--- image as table -->
                            <% String searchqueryprefix="http://www.walmart.com/search/search-ng.do?search_constraint=3920&search_query="; %>
                            <div style="font-size: 16px; margin-top:17px"> 
                                <% String allbooksbyauthor = searchqueryprefix+"john+grisham"; %>
                                Best selling books <a style="white-space: nowrap; overflow: hidden; color: rgb(153, 153, 153); font-size: 11px;" href=<%=allbooksbyauthor%> target="_blank"> [ see all ] </a>
                            </div>

                            <div style="">
                                <table cellpadding=0 cellspacing=0>
                                    <tr border="0">
                                        <%String book_link = searchqueryprefix+"a+time+to+kill+john+grisham";%>
                                        <td style="padding:5px"><a href=<%=book_link%> target="_blank"> <img src="./JohnGrishamATimeToKill.png" alt="A Time to Kill" title="A Time to Kill" border="0" height="110" width="72"> </a>
                                        </td>
                                        <%book_link = searchqueryprefix+"the+pelican+brief+john+grisham";%>
                                        <td style="padding:5px"><a href=<%=book_link%> target="_blank"><img src="./JohnGrishamPelicanBrief.png" alt="The Pelican Brief" title="The Pelican Brief" border="0" height="110" width="72"></a>
                                        </td>
                                        <%book_link = searchqueryprefix+"the+client+john+grisham";%>
                                        <td style="padding:5px"><a href=<%=book_link%> target="_blank"> <img src="./JohnGrishamSycamoreRow1.png" alt="The Client" title="Sycamore Row" border="0" height="110" width="72"></a>
                                    </td> 
                                        <%book_link = searchqueryprefix+"sycamore+row+john+grisham";%>
                                        <td style="padding:5px"> <a href=<%=book_link%> target="_blank"> <img src="./JohnGrishamSycamoreRow.png" alt="Sycamore Row" title="The Client" border="0" height="110" width="72"> </a>
                                        </td>
                                        <%book_link = searchqueryprefix+"the+street+lawyer+john+grisham";%>
                                        <td style="padding:5px" ><a href="<%=book_link%>" target="_blank" > <img src="./JohnGrishamTheStreetLawyer.png" alt="The Street Lawyer" title="The Street Lawyer" border="0" height="110" width="72"> </a>
                                        </td>


                                    </tr>
                                    <tr>
                                        <%book_link = searchqueryprefix+"a+time+to+kill+john+grisham";%>
                                        <td style="text-align:center; padding:5px; width:72"> <a href=<%=book_link%> target="_blank" title="A Time to Kill" style="font-size: 11px"> A Time to Kill</a>
                                        </td>
                                        <%book_link = searchqueryprefix+"the+pelican+brief+john+grisham";%>
                                        <td style="text-align:center; padding:5px; width:72"><a href=<%=book_link%> target="_blank" title="The Pelican Brief" style="font-size: 11px">The Pelican Brief</a>
                                        </td>
                                        <%book_link = searchqueryprefix+"sycamore+row+john+grisham";%>
                                        <td style="text-align:center; padding:5px; width:72" ><a href=<%=book_link%> target="_blank" title="Sycamore Row" style="font-size: 11px">Sycamore Row</a>
                                        </td>
                                        <%book_link = searchqueryprefix+"the+client+john+grisham";%>
                                        <td style="text-align:center; padding:5px; width:72" ><a href=<%=book_link%> target="_blank" title="The Client" style="font-size: 11px"> The Client</a>
                                        </td>
                                        <%book_link = searchqueryprefix+"the+street+lawyer+john+grisham";%>
                                        <td style="text-align:center; padding:5px; width:72" ><a href=<%=book_link%> target="_blank" title="The Street Lawyer" style="font-size: 11px">The Street Lawyer</a>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                            <!-- Books from related authors --!>
                            <div style="font-size: 16px; margin-top:17px"> 
                                Best selling books from authors like John Grisham  


                            </div>
                            <div style="">
                                <table cellpadding=0 cellspacing=0>
                                    <tr border="0">
                                        <%book_link = searchqueryprefix+"invisible+james+patterson";%>
                                        <td style="padding:5px"><a href=<%=book_link%> target="_blank"> <img src="./JamesPattersonInvisible.png" alt="Invisible" title="Invisible" border="0" height="110" width="72"> </a>
                                        </td>
                                        <%book_link = searchqueryprefix+"inferno+dan+brown";%>
                                        <td style="padding:5px"><a href=<%=book_link%> target="_blank"><img src="./DanBrownInferno.png" alt="Inferno" title="Inferno" border="0" height="110" width="72"></a>
                                        </td>
                                        <%book_link = searchqueryprefix+"dark+witch+nora+roberts";%>
                                        <td style="padding:5px"><a href=<%=book_link%> target="_blank"> <img src="./NorabRobertsDarkWitch.png" alt="Dark Witch" title="Dark Witch" border="0" height="110" width="72"></a>
                                    </td> 
                                        <%book_link = searchqueryprefix+"the+forgottern+david+baldacci";%>
                                        <td style="padding:5px"> <a href=<%=book_link%> target="_blank"> <img src="./DavidBaldacciTheForgotten.png" alt="The Forgotten" title="The Forgotten" border="0" height="110" width="72"> </a>
                                        </td>
                                        <%book_link = searchqueryprefix+"red+rabbit+tom+clancy";%>
                                        <td style="padding:5px" ><a href="<%=book_link%>" target="_blank" > <img src="./TomClancyRedRabbit.png" alt="Red Rabbit" title="Red Rabbit" border="0" height="110" width="72"> </a>
                                        </td>


                                    </tr>
                                    <tr>
                                        <%book_link = searchqueryprefix+"invisible+james+patterson";%>
                                        <td style="text-align:center; padding:5px; width:72; height:10"> <a href=<%=book_link%> target="_blank" title="Invisible" style="font-size: 11px"> Invisible</a>
                                        </td>
                                        <%book_link = searchqueryprefix+"inferno+dan+brown";%>
                                        <td style="text-align:center; padding:5px; width:72; height:10"><a href=<%=book_link%> target="_blank" title="Inferno" style="font-size: 11px">Inferno</a>
                                        </td>
                                        <%book_link = searchqueryprefix+"dark+witch+nora+roberts";%>
                                        <td style="text-align:center; padding:5px; width:72;height:10" ><a href=<%=book_link%> target="_blank" title="Dark Witch" style="font-size: 11px">Dark Witch</a>
                                        </td>
                                        <%book_link = searchqueryprefix+"the+forgotten+david+baldacci";%>
                                        <td style="text-align:center; padding:5px; width:72;height:10" ><a href=<%=book_link%> target="_blank" title="The Forgotten" style="font-size: 11px"> The Forgotten</a>
                                        </td>
                                        <%book_link = searchqueryprefix+"red+rabbit+tom+clancy";%>
                                        <td style="text-align:center; padding:5px; width:72;height:10" ><a href=<%=book_link%> target="_blank" title="Red Rabbit" style="font-size: 11px">Red Rabbit</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <%book_link = searchqueryprefix+"james+patterson";%>
                                        <td style="text-align:center; padding:5px; width:72"> <a href=<%=book_link%> target="_blank" title="James Patterson" style="color: rgb(25, 71, 209); font-size: 12px; font-weight: bold;"> James Patterson</a>
                                        </td>
                                        <%book_link = searchqueryprefix+"dan+brown";%>
                                        <td style="text-align:center; padding:5px; width:72"><a href=<%=book_link%> target="_blank" title="Dan Brown" style="color: rgb(25, 71, 209); font-weight: bold; font-size: 12px">Dan Brown</a>
                                        </td>
                                        <%book_link = searchqueryprefix+"nora+roberts";%>
                                        <td style="text-align:center; padding:5px; width:72" ><a href=<%=book_link%> target="_blank" title="Nora Roberts" style="color: rgb(25, 71, 209); font-weight:bold;font-size: 12px">Nora Roberts</a>
                                        </td>
                                        <%book_link = searchqueryprefix+"david+baldacci";%>
                                        <td style="text-align:center; padding:5px; width:72" ><a href=<%=book_link%> target="_blank" title="David Baldacci" style="color: rgb(25, 71, 209); font-weight:bold; font-size: 12px"> David Baldacci</a>
                                        </td>
                                        <%book_link = searchqueryprefix+"tom+clancy";%>
                                        <td style="text-align:center; padding:5px; width:72" ><a href=<%=book_link%> target="_blank" title="Tom Clancy" style="color: rgb(25, 71, 209); font-weight:bold;font-size: 12px">Tom Clancy</a>
                                        </td>
                                    </tr>
                                </table>

                            </div>


                            <br>

        <% if(objAI.getMovies() != null &&  objAI.getMovies().length > 0) { 
            String booklinkprefix = "http://www.walmart.com/search/search-ng.do?search_constraint=4096&search_query=";
            String searchauthorname = authorName;
            searchauthorname = searchauthorname.replace(" ", "+");
            String allmoviesbyauthor = booklinkprefix+searchauthorname;

        %>
		<div>
		<div style="padding: 10px 0px 0px;"><span
			style=";"> <a
                style="color: rgb(34, 34, 34); font-size: 16px;"> Best selling movie adaptions of John Grisham</a></span><a style="white-space: nowrap; overflow: hidden; color: rgb(153, 153, 153); font-size: 11px;" href=<%=allmoviesbyauthor%> target="_blank"> [ see all ] </a>
            
    <br>
    <div style="margin-top:5px">
        <% for(int i = 0; i < Math.min(5, objAI.getMovies().length); i ++) { 
            String movie = objAI.getMovies()[i];
            movie = movie.toLowerCase().trim();
            movie = movie.replace(" ","+");
            

            String booklink=booklinkprefix+movie;
            %>
            <a href=<%=booklink%> target="_blank">
				<%if(i == objAI.getMovies().length - 1 || i == 4) { %>

				<span
				style=""> <%=objAI.getMovies()[i]%>  </a> 
				</span>
				 <%} else { %>
				<span
				style=""> <%= objAI.getMovies()[i] %>, </a> 
				</span>

				 <%} %>
			<%} %>
            </div>
        </div>
    </div>
    <%}%>
	<% if(objAI.getTVShows() != null &&  objAI.getTVShows().length > 0) { %>
		<div>
		<div style="padding: 7px 0px 0px;"><span
			style="font-weight: bolder;"> <a
            style="color: rgb(34, 34, 34); font-size: 15px;"> TV Shows</a></span>: 
            
			<% for(int i = 0; i < Math.min(3, objAI.getTVShows().length); i ++) { %>
				<%if(i == objAI.getTVShows().length - 1) { %>
				<span
				style="color: rgb(41, 26, 198);"> <%=objAI.getTVShows()[i]%>  </a> 
				</span>
				 <%} else { %>
				<span
				style="color: rgb(41, 26, 198);"> <%= objAI.getTVShows()[i] %>, </a> 
				</span>

				 <%} %>
			<%} %>
        </div>
    </div>
    <%}%>








                                















		                    </div>
		                </div>
		
		            </div>
	            </ol>


	</div>

	<div style="width: 350px; float: left; margin-left:50px">
	<br>
	<ol
		style="margin: 0px; padding: 0px; border: 0px; color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 15px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
        <div

        style="border: none; line-height: 1.24; margin-top: 6px; position: relative; padding: 0px 15px 15px; width: 424px; -webkit-box-shadow: rgba(0, 0, 0, 0.2) 0px 1px 4px; box-shadow: rgba(0, 0, 0, 0.2) 0px 1px 4px; margin-left: 2px;">
            <div>
                <div>
                    <div aria-level="5" style="margin: 0px 0px 5px; padding: 9px 0px 0px;">
                        <a style="color: rgb(34, 34, 34); font-size:18px">Customers also searched for books by</a> 
                    </div>
                    <table >
                        <tr>
                            <%String authorsearchprefix="http://www.walmart.com/search/search-ng.do?search_constraint=4096&search_query=";%>
                            <%String authorsearchlink = authorsearchprefix + "james+patterson";%>
                            <td style="padding:13px"> <a href=<%=authorsearchlink%> target="_blank" title="James Patterson"><img src="./freebaseimages/James_Patterson.freebaseJson.1" alt="James Patterson" title="James Patterson" border="0" height="90" width="72"> </a>
                            </td>
                            <% authorsearchlink=authorsearchprefix+"dan+brown";%>
                            <td style="padding:13px"> <a href=<%=authorsearchlink%> target="_blank" title="Dan Brown"> <img src="./freebaseimages/Dan_Brown.freebaseJson.1" alt="Dan Brown" title="Dan Brown" border="0" height="90" width="72"> </a>
                            </td>
                            <% authorsearchlink=authorsearchprefix+"nora+roberts";%>
                            <td style="padding:13px"><a href=<%=authorsearchlink%> target="_blank" title="Nora Roberts" > <img src="./freebaseimages/Nora_Roberts.freebaseJson.1" alt="Nora Roberts" title="Nora Roberts" border="0" height="90" width="72"></a>
                            </td>
                            <% authorsearchlink=authorsearchprefix+"david+baldacci";%>
                            <td style="padding:13px"><a href=<%=authorsearchlink%> target="_blank" title="David Baldacci"> <img src="./freebaseimages/David_Baldacci.freebaseJson.1" alt="David Baldacci" title="David Baldacci" border="0" height="90" width="72"> </a>
                            </td>
                        </tr>
                        <tr>
                            <% authorsearchlink=authorsearchprefix+"james+patterson";%>
                            <td style="padding:0px;width:72;text-align:center; "><a title="James Patterson" style="font-size: 12px" href=<%=authorsearchlink%> target="_blank"> James Patterson </a></td>
                            <% authorsearchlink=authorsearchprefix+"dan+brown";%>
                            <td style="padding:0px;width:72;text-align:center; "> <a title="Dan Brown" style="font-size: 12px" href=<%=authorsearchlink%> target="_blank"> Dan Brown </a></td>
                            <% authorsearchlink=authorsearchprefix+"nora+roberts";%>
                            <td style="padding:0px;width:72;text-align:center; "><a title="Nora Roberts" style="font-size: 12px" href=<%=authorsearchlink%> target="_blank"> Nora Roberts </a> </td> 
                            <% authorsearchlink=authorsearchprefix+"david+baldacci";%>
                            <td style="padding:0px;width:72;text-align:center; "><a title="David Baldacci" style="font-size: 12px" href=<%=authorsearchlink%> target="_blank"> David Baldacci </a></td> 
                        </tr>
                    </table>

                </div>
            </div>
        </div>




    </ol>
    </div>
	<%} else {%> <br>
	<br>
	<h3 class="text-info">
	<p>Results from Walmart:</p>
	</h3>
	<%
                    String walPagename = FetchWalmartpage.getPagename(authorName);
                    %> <iframe src=<%=walPagename%> height=1500
		width=800 frameborder="0" scrolling="no"></iframe> <%} %> <%} else {%> <br>
	<br>
	<br>
	<br>

	
	
	<div> <img src='walpics/mainpanel.png'> </div>
	
	
	
	<%} %>
	</div>
	<script src="bootstrap/js/bootstrap.js"></script>
</body>
</html>

