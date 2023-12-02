import java.util.Scanner;
import Model.Item;

public class Main {

    public static Item[] Items = new Item[] {
            new Item("Item 1", 50.0, "Test 1"),
            new Item("Milktea", 15.0, "Test 2")
    };

    public static void main(String[] args) {

        try (Scanner scanner = new Scanner(System.in))
        {
            for (;;)
            {
                System.out.println("==========================================");

                System.out.println("Menu:");
                System.out.println("\t5 Item Lists");
                System.out.println("\t4 Search Item");
                System.out.println("\t3 Remove Item");
                System.out.println("\t2 Add Item");
                System.out.println("\t1 Exit");

                System.out.print("-> ");

                int option = scanner.nextInt();

                if (option < 1 || option > 5)
                {
                    System.out.println("Invalid Input!");
                    System.out.println("==========================================");
                    continue;
                }

                Item[] _tempArray;
                String itemName = "";

                switch (option)
                {
                    case 5:
                        if (Items.length < 1)
                        {
                            System.out.println("Items is empty!");
                            continue;
                        }

                        for (Item item : Items)
                        {
                            System.out.println(item.getName());
                        }
                        break;
                    case 4:
                        System.out.print("Search item name: ");
                        scanner.nextLine();
                        itemName = scanner.nextLine();

                        String[] itemNameSplit = itemName.split(" ");

                        for (int i = 0; i < Items.length; i++)
                        {
                            for (int j = 0; j < itemNameSplit.length; j++)
                            {
                                if (Items[i].getName().contains(itemNameSplit[j]))
                                {
                                    System.out.println(Items[i].getName());
                                }
                            }
                        }
                        break;
                    case 3:
                        System.out.print("Enter a item name: ");
                        scanner.nextLine();
                        itemName = scanner.nextLine();

                        boolean isExists = false;

                        for (Item item : Items)
                        {
                            if (item.getName().equalsIgnoreCase(itemName)) {
                                isExists = true;
                                break;
                            }
                        }

                        if (!isExists)
                        {
                            System.out.printf(" \"%s\" does not exists. \n", itemName);
                            continue;
                        }

                        _tempArray = new Item[Items.length - 1];

                        for (int i = 0; i < Items.length; i++)
                        {
                            if (Items[i].getName().equalsIgnoreCase(itemName)) continue;

                            _tempArray[i] = Items[i];
                        }

                        System.out.printf("Successfully remove \"%s\"\n", itemName);

                        Items = _tempArray;
                        break;
                    case 2:
                        System.out.print("Enter a item name: ");
                        scanner.nextLine();
                        itemName = scanner.nextLine();

                        System.out.print("Enter a item cost: ");
                        double itemCost = Double.parseDouble(scanner.nextLine());

                        System.out.print("Enter a item description: ");
                        String itemDesc = scanner.nextLine();

                        _tempArray = new Item[Items.length + 1];
                        _tempArray[_tempArray.length - 1] = new Item(itemName, itemCost, itemDesc);

                        System.out.println("==========================================");
                        System.out.println("New item:");
                        System.out.printf("\tName: %s\n\tCost: %s\n\tDescription: %s\n", itemName, itemCost, itemDesc);

                        Items = _tempArray;
                        break;
                }

            }
        }

    }

}
