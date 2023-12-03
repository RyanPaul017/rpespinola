import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

//        | ProductID | ProductName         | Description                              | Price | Quantity | Category      |
//        |-----------|---------------------|------------------------------------------|-------|----------|---------------|
//        | 1         | Laptop              | High-performance laptop                   | 999   | 20      | Electronics   |

        String[][] Table = new String[][] {
                { "ProductID", "10" },
                { "ProductName", "20" },
                { "Description", "40" },
                { "Price", "7" },
                { "Quantity", "10" },
                { "Category", "13" }
        };

        Item[] Items = new Item[] {
                new Item(1, "Laptop", "High-performance laptop", 9999, 20, "Electronics"),
                new Item(2, "T-shirt", "Cotton T-shirt in various colors", 20, 100, "Clothing"),
                new Item(3, "Book", "Best-selling novel", 15, 50, "Books"),
                new Item(4, "Smartphone", "Latest model smartphone", 699, 30, "Electronics"),
                new Item(5, "Sneakers", "Running shoes for active lifestyle", 80, 40, "Appliances")
        };

        int highestNameLength = 0, highestDescLength = 0, highestPrice = 0, highestQuantity = 0, highestCategoryLength = 0;

        for (int i = 0; i < Table.length; i++)
        {
            String ColumnName = Table[i][0];
            int Length = Integer.parseInt(Table[i][1]);

            for (int j = 0; j < Items.length; j++)
            {
                switch (ColumnName) {
                    case "ProductName" -> {
                        highestNameLength = Items[j].getName().length();
                        Table[i][1] = Length < highestNameLength ? String.valueOf(highestNameLength) : Table[i][1];
                    }
                    case "Description" -> {
                        Table[i][1] = Length < highestDescLength ? String.valueOf(highestDescLength) : Table[i][1];
                        highestDescLength = Items[j].getDescription().length();
                    }
                    case "Price" -> {
                        highestPrice =  Items[j].getPrice();
                        Table[i][1] = Length < String.valueOf(highestPrice).length() ? String.valueOf(highestPrice) : Table[i][1];
                    }
                    case "Quantity" -> {
                        highestQuantity = Items[j].getQuantity();
                        Table[i][1] = Length < String.valueOf(highestQuantity).length() ? String.valueOf(highestQuantity) : Table[i][1];
                    }
                    case "Category" -> {
                        highestCategoryLength = Items[j].getCategory().length();
                        Table[i][1] = Length < highestCategoryLength ? String.valueOf(highestCategoryLength) : Table[i][1];
                    }
                }
            }
        }

        for (int i = 0; i < Table.length; i++)
        {
            String ColumnName = Table[i][0];
            int Length = Integer.parseInt(Table[i][1]);

            System.out.print("| ");

            for (int j = 0; j < Length + 2; j++)
            {
                if (j < ColumnName.length())
                {
                    System.out.print(ColumnName.charAt(j));
                }
                else
                {
                    System.out.print(" ");
                }
            }

            if (i >= Table.length - 1)
                System.out.print("|\n");
        }

        for (int i = 0; i < Table.length; i++)
        {
            int Length = Integer.parseInt(Table[i][1]);

            System.out.print("|-");

            for (int j = 0; j < Length + 2; j++)
            {
                System.out.print("-");
            }

            if (i >= Table.length - 1)
                System.out.print("|\n");
        }

        for (int i = 0; i < Items.length; i++)
        {
            for (int j = 0; j < Table.length; j++)
            {
                String Column = "";
                String Type = Table[j][0];
                int Length = Integer.parseInt(Table[j][1]);

                switch (Type) {
                    case "ProductID" -> Column = Integer.toString(Items[i].getId());
                    case "ProductName" -> Column = Items[i].getName();
                    case "Description" -> Column = Items[i].getDescription();
                    case "Price" -> Column = Integer.toString(Items[i].getPrice());
                    case "Quantity" -> Column = Integer.toString(Items[i].getQuantity());
                    case "Category" -> Column = Items[i].getCategory();
                }

                System.out.print("| ");

                for (int k = 0; k < Length + 2; k++)
                {
                    if (k < Column.length())
                    {
                        System.out.print(Column.charAt(k));
                    }
                    else
                    {
                        System.out.print(" ");
                    }
                }

                if (j >= Table.length - 1)
                    System.out.print("|\n");
            }
        }

    }

}

class Item {

    private final int id;
    private final String Name;
    private final String Description;
    private final int Price;
    private final int Quantity;
    private final String Category;

    public Item(int id, String Name, String Descriptions, int Price, int Quantity, String Category)
    {
        this.id = id;
        this.Name = Name;
        this.Description = Descriptions;
        this.Price = Price;
        this.Quantity = Quantity;
        this.Category = Category;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return Name;
    }

    public String getDescription() {
        return Description;
    }

    public int getPrice() {
        return Price;
    }

    public int getQuantity()
    {
        return Quantity;
    }

    public String getCategory() {
        return Category;
    }

}