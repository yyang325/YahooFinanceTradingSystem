
	
	
	
	<div class="container">
		<section id="main-content">
			<section class="wrapper" ng-controller="homeController">
				<!-- page starts -->
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<section class="panel panel-info">
							<header class="panel-heading" align="center">
								<p style="font-size: 20px">Welcome:</p>
							</header>
							<div class="panel-body">
								<div style="text-align: center">
									<span style="font-size: 20px"><b>{{currentTime | date:'HH'| greet}}, {{user.username}}. It's {{currentTime | date:'MM/dd/yyyy @ h:mma'}}</b></span>
								</div>
							</div>
						</section>
					</div>
				</div>

				<div class="col-lg-8 col-md-12">
					<section class="panel panel-info">
						<header class="panel-heading" align="center">
							<p style="font-size: 20px">Top Stories</p>
						</header>
						<div class="panel-body">
							
							<div id="container"  style="color: #15c;">
								<div class='output_data'>
									
									<ul id='listcontainer' style="color: #15c;">
										
				
									</ul>
								</div>
							</div>
			
						</div>
					</section>
				</div>
				
				<div class="col-lg-4 col-md-12">
					<section class="panel panel-info">
						<header class="panel-heading" align="center">
							<p style="font-size: 20px">Market Trend</p>
						</header>
						<div class="panel-body">
							<div id="tf-market" class="markets_chart">
							<div id="tradingview_690a3-wrapper"
								style="position: relative; box-sizing: content-box; width: 100%; height: 530px; margin: 0 !important; padding: 0 !important; font-family: Arial, sans-serif;">
								<div
									style="width: 100%; height: 530px; background: #fff; padding: 0 !important;">
									<iframe id="tradingview_690a3"
										src="https://dwq4do82y8xi7.cloudfront.net/miniwidgetembed/?Equities=SPX500, NAS100, DOWI, JPN225,SPY, FTSE, DAX&amp;Commodities=GOLD,SILVER,OIL,GAS,BASE%20METALS,URANIUM,LITHIUM,WHEAT&amp;Bonds=1-3%20YEAR,3-7%20YEAR,7-10%20YEAR,20%20YEAR,SHORT%20TERM%20US,EURO%20DEBT,GERMANY%20BOND,ASIA%20LOCAL%20DEBT&amp;Forex=FX%3AEURUSD,FX%3AGBPUSD,FX%3AUSDJPY,FX%3AUSDCHF,FX%3AAUDUSD,FX%3AUSDCAD,FX%3ANZDUSD,FX%3AEURJPY&amp;tabs=Equities%2CCommodities%2CBonds%2CForex&amp;QQQ=NASDAQ%3AQQQ&amp;DIA=AMEX%3ADIA&amp;SPY=AMEX%3ASPY&amp;TWITTER=NYSE%3ATWTR&amp;FACEBOOK=NASDAQ%3AFB&amp;GOOGLE=NASDAQ%3AGOOG&amp;MICROSOFT=NASDAQ%3AMSFT&amp;ORACLE=NYSE%3AORCL&amp;GOLD=AMEX%3AGLD&amp;SILVER=AMEX%3ASLV&amp;OIL=AMEX%3AUSO&amp;GAS=AMEX%3AUNG&amp;BASE%20METALS=AMEX%3ADBB&amp;URANIUM=AMEX%3AURA&amp;LITHIUM=AMEX%3ALIT&amp;WHEAT=AMEX%3AWEAT&amp;1-3%20YEAR=AMEX%3ASHY&amp;3-7%20YEAR=AMEX%3AIEI&amp;7-10%20YEAR=AMEX%3AIEF&amp;20%20YEAR=AMEX%3ATLT&amp;SHORT%20TERM%20US=AMEX%3ASCHO&amp;EURO%20DEBT=AMEX%3AEU&amp;GERMANY%20BOND=FX%3ABUND&amp;ASIA%20LOCAL%20DEBT=AMEX%3AALD&amp;timeAxisBackgroundColor=%23F3F2F3&amp;activeTickerBackgroundColor=%23EDF0F3&amp;trendLineColor=%23FF7965&amp;underLineColor=%23F0F0F0&amp;fontColor=%2383888D&amp;gridLineColor=%23E9E9EA&amp;large_chart_url=http%3A%2F%2Fwww.investopedia.com%2Fmarkets%2Fsymbol-redirect.aspx&amp;width=100%25&amp;height=530px&amp;utmsource=www.investopedia.com&amp;utmmedium=www.investopedia.com/"
										width="100%" height="530px" frameborder="0"
										allowtransparency="true" scrolling="no"
										style="margin: 0 !important; padding: 0 !important;">
									</iframe>
								</div>
								<div
									style="position: absolute; display: block; box-sizing: content-box; height: 24px; width: 100%; bottom: 0; left: 0; margin: 0; padding: 0; font-family: Arial, sans-serif;">
									<div
										style="display: block; margin: 0 1px 1px 1px; line-height: 7px; box-sizing: content-box; height: 11px; padding: 6px 10px; text-align: right; background: #fff;">
										<a
											href="https://www.tradingview.com/?utmsource=www.investopedia.com&amp;utmmedium=www.investopedia.com/"
											target="_blank"
											style="color: #0099d4; text-decoration: none; font-size: 11px;">
										</a>
									</div>
								</div>
							</div>
						</div>
						</div>
					</section>
				</div>

		</section>		
	</section>				
  </div>
	
