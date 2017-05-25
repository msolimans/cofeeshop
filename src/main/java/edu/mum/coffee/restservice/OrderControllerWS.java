package edu.mum.coffee.restservice;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import edu.mum.coffee.domain.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import edu.mum.coffee.domain.Order;
import edu.mum.coffee.service.OrderService;

@RestController
@RequestMapping("/rest/order")
public class OrderControllerWS {

	@Autowired
	OrderService orderService;

    @GetMapping(value = "/")
	public ResponseEntity<List<Order>> getAllOrders() {
        List<Order> orders = orderService.findAll();
		if (orders.size()==0) {
			return new ResponseEntity<List<Order>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Order>>(orders, HttpStatus.OK);

	}

    @PostMapping(value="/create")
	public  ResponseEntity<Order> saveOrder(@Valid @RequestBody Order order){
		orderService.save(order);
		return new ResponseEntity<Order>(order, HttpStatus.CREATED);
	}

    @GetMapping(value="/{id}")
	public ResponseEntity<Order> getOrderById(@PathVariable("id") int id)
	{
		Order foundOrder = orderService.findById(id);
		if (foundOrder == null) {
			return new ResponseEntity<Order>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<Order>(HttpStatus.GONE);
        //return orderService.findById(orderId).getOrderLines();
	}
}
