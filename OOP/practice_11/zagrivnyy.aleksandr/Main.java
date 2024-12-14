import java.util.*;

public class Main {
    static class Node {
        String position;
        int gCost;
        double fCost;

        Node(String position, int gCost, double fCost) {
            this.position = position;
            this.gCost = gCost;
            this.fCost = fCost;
        }
    }

    public static List<String> eatFly(String spider, String fly) {
        PriorityQueue<Node> openSet = new PriorityQueue<>(Comparator.comparingDouble(node -> node.fCost));
        Set<String> closedSet = new HashSet<>();
        Map<String, String> cameFrom = new HashMap<>();
        Map<String, Integer> gScore = new HashMap<>();

        openSet.add(new Node(spider, 0, heuristic(spider, fly)));
        gScore.put(spider, 0);

        while (!openSet.isEmpty()) {
            Node current = openSet.poll();
            String currentPos = current.position;

            if (currentPos.equals(fly)) {
                return reconstructPath(cameFrom, fly);
            }

            closedSet.add(currentPos);

            for (String neighbor : getNeighbors(currentPos)) {
                if (closedSet.contains(neighbor)) {
                    continue;
                }

                int tentativeGScore = gScore.get(currentPos) + costBetween(currentPos, neighbor);

                if (!gScore.containsKey(neighbor) || tentativeGScore < gScore.get(neighbor)) {
                    gScore.put(neighbor, tentativeGScore);
                    double fCost = tentativeGScore + heuristic(neighbor, fly);
                    openSet.add(new Node(neighbor, tentativeGScore, fCost));
                    cameFrom.put(neighbor, currentPos);
                }
            }
        }

        return Collections.emptyList();
    }

    private static List<String> reconstructPath(Map<String, String> cameFrom, String current) {
        List<String> path = new ArrayList<>();
        path.add(current);
        while (cameFrom.containsKey(current)) {
            current = cameFrom.get(current);
            path.add(current);
        }
        Collections.reverse(path);
        return path;
    }

    private static int costBetween(String from, String to) {
        double distance = geometricDistance(from, to);

        if (from.charAt(1) == '0' || to.charAt(1) == '0') {
            distance *= 0.5;
        }

        return (int) Math.ceil(distance);
    }

    private static double geometricDistance(String from, String to) {
        int r1 = Character.getNumericValue(from.charAt(1));
        int r2 = Character.getNumericValue(to.charAt(1));

        char axisFrom = from.charAt(0);
        char axisTo = to.charAt(0);

        double theta1 = Math.toRadians((axisFrom - 'A') * 45);
        double theta2 = Math.toRadians((axisTo - 'A') * 45);

        double deltaTheta = Math.abs(theta1 - theta2);

        if (r1 == 0 || r2 == 0) {
            return r1 + r2;
        }

        return Math.sqrt(r1 * r1 + r2 * r2 - 2 * r1 * r2 * Math.cos(deltaTheta));
    }

    private static double heuristic(String from, String to) {
        return geometricDistance(from, to);
    }

    private static List<String> getNeighbors(String position) {
        List<String> neighbors = new ArrayList<>();
        char axis = position.charAt(0);
        int ring = Character.getNumericValue(position.charAt(1));

        if (ring > 0) neighbors.add("" + axis + (ring - 1));
        neighbors.add("" + axis + (ring + 1));

        if (axis > 'A') neighbors.add("" + (char) (axis - 1) + ring);
        if (axis < 'H') neighbors.add("" + (char) (axis + 1) + ring);

        if (ring == 1) neighbors.add("A0");

        return neighbors;
    }

    private static boolean isValidPosition(String position) {
        if (position.length() != 2) {
            return false;
        }

        char axis = position.charAt(0);

        return axis >= 'A' && axis <= 'H' && Character.isDigit(position.charAt(1));
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String spider, fly;

        while (true) {
            System.out.print("Введите координаты паука (например, H3): ");
            spider = scanner.nextLine().toUpperCase();
            if (isValidPosition(spider)) {
                break;
            } else {
                System.out.println("Некорректные координаты! Попробуйте еще раз.");
            }
        }

        while (true) {
            System.out.print("Введите координаты мухи (например, E2): ");
            fly = scanner.nextLine().toUpperCase();
            if (isValidPosition(fly)) {
                break;
            } else {
                System.out.println("Некорректные координаты! Попробуйте еще раз.");
            }
        }

        List<String> path = eatFly(spider, fly);

        if (path.isEmpty()) {
            System.out.println("Путь не найден!");
        } else {
            System.out.println("Кратчайший путь: " + path);
        }
    }
}
