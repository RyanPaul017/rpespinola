package Model;

public class Item {

    private final String Name;
    private final double Cost;
    private final String Description;

    public Item(String Name, double Cost, String Description)
    {
        this.Name = Name;
        this.Cost = Cost;
        this.Description = Description;
    }

    public String getName() {
        return Name;
    }

    public double getCost() {
        return Cost;
    }

    public String getDescription() {
        return Description;
    }

}
