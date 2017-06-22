<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Weather Report</title>
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- bootstrap library -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/weather.js"></script>
    </head>
    <body style="margin-top: 28px;">

        <div class="container-fluid"  >
            <div class="row" >
                <div class="col-md-12" style="color:#ff9800;margin-bottom: 50px;">
                    <h3>Enter Zipcode for Weather forecast</h3>
                    <div class="input-group" style="margin-top: 28px;">
                        <input type="text" class="form-control" id="zipInput" />
                        <span class="input-group-btn" style="width:0;">
                            <button id="btn-weather" type="button" class="btn btn-primary" style="background-color: #ff9800;" >GO!</button>
                        </span>
                    </div>
                </div>
                <div id="error-container" class="col-md-8">
                    <div class="alert alert-dismissable alert-danger"
                    contenteditable="true">
                    <h4>Alert!</h4>
                    <span id="error-message"></span>                   
                </div>              
            </div>

            <div id="data-container" class="col-md-8 hidden" style="border: 3px solid #FF9800;margin-left: 14px;">  
                <div class="main-data">
                    <div class="data-head" style="width: 75%; float: left;">
                        <h3>Weather Info for given zip: <span id="zipCode"></span></h3>
                        <h4>City: <span id="city"></span></h4>
                        <h4>Country: <span id="country"></span></h4>
                        <h4><span id="timestamp" style="color:#ff9800;"></span></h4>
                        <h4><span id="weather-desc" style="color:#ff9800;"></span></h4>
                    </div>
                    <div class="col-md-3 col-md-offset-right  col-xs-10  col-sm-3 col-lg-3 col-lg-offset-right" style="margin-top:10px;">
                        <div class="panel panel-default" style="border:1px solid rgba(158, 158, 158, 0.6)">
                            <div class="panel-heading" style="color: #fff;background-color: #FF9800; border-color: #2e6da4;">
                                <h3 class="panel-title">Wind Speed</h3>
                            </div>
                            <div id="windSpeed-body" class="panel-body">Panel content</div>
                        </div>
                    </div>
                </div>               
                <div class="sub-data col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="row">
                        <div class="col-md-4 col-sm-4  col-lg-4 col-xs-10">
                            <div class="panel panel-default" style="border:1px solid rgba(158, 158, 158, 0.6)">
                                <div class="panel-heading" style="color: #fff;background-color: #FF9800; border-color: #2e6da4;">
                                    <h3 class="panel-title">Temperature</h3>
                                </div>
                                <g:img dir="images" file="wsymbol.png" style="float: left;margin: 7px 12px 0 7px;height: 28px;width: 37px;"/>
                                <div id="temperature-body" class="panel-body" >Panel content</div>                             
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4  col-lg-4 col-xs-10">
                            <div class="panel panel-default" style="border:1px solid rgba(158, 158, 158, 0.6)">
                                <div class="panel-heading" style="color: #fff;background-color: #FF9800; border-color: #2e6da4;">
                                    <h3 class="panel-title">Pressure</h3>
                                </div>
                                <div id="percipitation-body" class="panel-body">Panel
                                    content</div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4  col-lg-4 col-xs-10">
                            <div class="panel panel-default" style="border:1px solid rgba(158, 158, 158, 0.6)">
                                <div class="panel-heading" style="color: #fff;background-color: #FF9800; border-color: #2e6da4;">
                                    <h3 class="panel-title">Humidity</h3>
                                </div>
                                <div id="humidity-body" class="panel-body">Panel content</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="data-container-footer" class="hidden col-xs-10 col-md-12 col-lg-12 col-sm-10" style="border: 3px solid #FF9800;margin-bottom: 10px;margin-top:10px">  
				<div class="row">
                    <h4  class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><span id="weather-sunrise" >Sunrise :</span></h4>
                    <h4  class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><span id="weather-sunset" >Sunset :</span></h4>
                    <h4  class="col-xs-12 col-sm-12 col-md-4 col-lg-4"><span id="weather-visibility">Visibility :</span></h4>
					</div>
                </div>
            </div>
        </div>
    </body>
</html>
