#include <iostream>
#include <cmath>
#include <vector>

struct Point {
    double x, y;

    Point(double x, double y) : x(x), y(y) {}
};

double calculateDistance(const Point& p1, const Point& p2) {
    double deltaX = p2.x - p1.x;
    double deltaY = p2.y - p1.y;
    return std::sqrt(deltaX * deltaX + deltaY * deltaY);
}

std::vector<Point> createPathWithDistance(const Point& start, const Point& end, double distance) {
    std::vector<Point> path;
    path.push_back(start);

    double totalDistance = calculateDistance(start, end);
    int numPoints = static_cast<int>(totalDistance / distance);

    double deltaX = (end.x - start.x) / numPoints;
    double deltaY = (end.y - start.y) / numPoints;

    for (int i = 1; i <= numPoints; ++i) {
        double newX = start.x + i * deltaX;
        double newY = start.y + i * deltaY;
        path.push_back(Point(newX, newY));
    }

    path.push_back(end);

    return path;
}

int main() {
    // 시작점과 종료점을 정의합니다.
    Point start(9.51, 18.40);
    Point end(9.1776, 36.0534);

    // 원하는 거리만큼의 간격을 입력합니다.
    double desiredDistance;
    std::cout << "원하는 거리만큼의 간격을 입력하세요: ";
    std::cin >> desiredDistance;

    std::vector<Point> path = createPathWithDistance(start, end, desiredDistance);

    // 생성된 경로를 출력합니다.
    // std::cout << "생성된 경로:\n";
    // for (const Point& p : path) {
    //     std::cout << "(" << p.x << ", " << p.y << ")\n";
    // }

    std::cout << "생성된 경로:\n";
    for (const Point& p : path) {
        std::cout << p.x << "\t" << p.y << "\n";
    }

    return 0;
}
