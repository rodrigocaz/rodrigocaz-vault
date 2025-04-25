import javax.swing.*;
public class S1P2 {
    public static void main(String[] args) {
        String input;
        input = JOptionPane.showInputDialog("Enter the Secret Message.");
        if(input.equals("Evil Genius")) {
            System.out.println("YOU GOT THE SECRET MESSAGE!!!");
        } else {
            System.out.println("WRONG!!! Hahahahaha!");
        }
    }
}