package ng.com.nokt.demodelivery.controllers;

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
    @SuppressWarnings("unused")
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
        return "features";
    }
}
