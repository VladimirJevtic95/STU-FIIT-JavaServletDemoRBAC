package watches;

public class WatchBean {

    private int id;
    private String brand, model, country, exclusivity, release_date, admin_username;
    private int price;

    public WatchBean() {
    }

    public WatchBean(int id, String brand, String model, String country, String exclusivity, String release_date, int price, String admin_username) {
        super();
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.country = country;
        this.exclusivity = exclusivity;
        this.release_date = release_date;
        this.price = price;
        this.admin_username = admin_username;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getExclusivity() {
        return exclusivity;
    }

    public void setExclusivity(String exclusivity) {
        this.exclusivity = exclusivity;
    }

    public String getRelease_date() {
        return release_date;
    }

    public void setRelease_date(String release_date) {
        this.release_date = release_date;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getAdmin_username() {
        return admin_username;
    }

    public void setAdmin_username(String admin_username) {
        this.admin_username = admin_username;
    }
}
