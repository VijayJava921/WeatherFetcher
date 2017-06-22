package com.weather.services

import grails.transaction.Transactional
import groovyx.net.http.*
import groovyx.net.http.HTTPBuilder
import static groovyx.net.http.ContentType.*
import static groovyx.net.http.Method.*
import grails.converters.JSON 

@Transactional
class WeatherService {     
    def getData(String zip){
        def http = new HTTPBuilder("http://api.worldweatheronline.com")
        def data=[success : false, resData: null]
        try{      
            http.get( path : "/premium/v1/weather.ashx",query : [key:'dbc935d4b38e48988ee91100172106',q:zip,format:'json',includelocation:'yes'] ) 
            { resp, respData ->                  
                if(respData.data.error)                
                data.resData=respData.data.error[0].msg
                else{                
                    data.resData=respData                    
                    data.success=true                    
                }
            }
        }
        catch(Exception e){            
            data.resData=e.getMessage()
            log.fatal("Failed to get data from API, error:"+e.getMessage())
            throw e 
        }       
        return data
    }
}
