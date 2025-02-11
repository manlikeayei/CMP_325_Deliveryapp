package ng.com.nokt.demodelivery.controllers;

import ng.com.nokt.demodelivery.entites.Item;
import ng.com.nokt.demodelivery.entites.Vehicle;
import ng.com.nokt.demodelivery.services.ItemService;
import ng.com.nokt.demodelivery.services.VehicleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class DeliveryController {

    private final VehicleService vehicleService;

    private final ItemService itemService;

    public DeliveryController(VehicleService vehicleService, ItemService itemService) {
        this.vehicleService = vehicleService;
        this.itemService = itemService;
    }

    @GetMapping("/")
    public String index(){
        return "index";
    }

    

    @GetMapping("/create-vehicle")
    public String createVehicle(Model model){
        Vehicle vehicle = new Vehicle();
        model.addAttribute("vehicle", vehicle)
                .addAttribute("allVehicles", vehicleService.getAllVehicles());
        return "features";
    }

    @PostMapping("/post-vehicle")
    public String postVehicle(Model model, @ModelAttribute("vehicle") Vehicle vehicle){
        String message = "Vehicle created successfully";
        vehicleService.createVehicle(vehicle);
        model.addAttribute("message", message);
        model.addAttribute("vehicle", vehicle).addAttribute("allVehicles", vehicleService.getAllVehicles());
        return "redirect:/create-vehicle";
    }

    @GetMapping("/create-item")
    public String createItem(Model model){
    Item item = new Item();
    model.addAttribute("item", item)
           .addAttribute("allItems", itemService.getAllItems());
           return "addItems";
    }

    @PostMapping("/post-item")
    public String postItem(Model model, @ModelAttribute("item") Item item){
        
        itemService.createItem(item);
        model.addAttribute("item", item).addAttribute("allItems", itemService.getAllItems());
        return "redirect:/create-vehicle";
    }
    
    
    

}
