package com.example.diary.listener;

import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;

/**
 * Application Lifecycle Listener implementation class SessionCounterListener
 *
 */
public class SessionCounterListener implements HttpSessionAttributeListener {

    /**
     * Default constructor. 
     */
    public SessionCounterListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent se)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent se)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent se)  { 
         // TODO Auto-generated method stub
    }
    
	/*	
package com.example.diary.listener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.example.diary.service.CounterService;
import com.example.diary.vo.Counter;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;

@WebListener
public class SessionCounterListener implements HttpSessionAttributeListener {
@Autowired
private CounterService counterService;

    public void attributeAdded(HttpSessionBindingEvent se , Model model)  { 
    	
    	Counter counter = counterService.selectCountByToday();
    	if(counter==null) {
    		counterService.insertCountByToday();
    	} else {
    		counterService.updateCountByToday();
    	}
    	model.addAttribute("counter",counter);
    }
	
}

	 */
}
