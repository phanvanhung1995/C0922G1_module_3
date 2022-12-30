import javax.xml.crypto.Data;
import java.util.Date;

public class Customer {
    private String name ;
    private String dateOfBirt ;
    private String address;
    private String img;

    public Customer() {
    }

    public Customer(String name, String dateOfBirt, String address, String img) {
        this.name = name;
        this.dateOfBirt = dateOfBirt;
        this.address = address;
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirt() {
        return dateOfBirt;
    }

    public void setDateOfBirt(String dateOfBirt) {
        this.dateOfBirt = dateOfBirt;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
