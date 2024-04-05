#include <iostream>
#include <cmath>
#include <vector>

struct Point {
    double x, y;

    Point(double x, double y) : x(x), y(y) {}
};

std::vector<Point> createPathWithCurvature(const Point& start, const Point& end, double curvature, int numPoints) {
    std::vector<Point> path;
    path.push_back(start);

    double totalDistance = std::hypot(end.x - start.x, end.y - start.y);
    double deltaTheta = curvature * totalDistance / (numPoints - 1);

    double theta = std::atan2(end.y - start.y, end.x - start.x);

    for (int i = 1; i < numPoints; ++i) {
        theta += deltaTheta;

        double newX = start.x + totalDistance * std::cos(theta);
        double newY = start.y + totalDistance * std::sin(theta);

        path.push_back(Point(newX, newY));
    }

    path.push_back(end);

    return path;
}

int main() {
    // 시작점과 종료점을 정의합니다.
    Point start(9.1776, 36.0534);
    Point end(6.3512, 38.2116);

    // 원하는 곡률을 입력합니다.
    double curvature;
    std::cout << "원하는 곡률을 입력하세요: ";
    std::cin >> curvature;

    // 원하는 점의 개수를 입력합니다.
    int numPoints;
    std::cout << "원하는 점의 개수를 입력하세요: ";
    std::cin >> numPoints;

    std::vector<Point> path = createPathWithCurvature(start, end, curvature, numPoints);

    // 생성된 경로를 출력합니다.
    std::cout << "생성된 경로:\n";
    for (const Point& p : path) {
        std::cout << "(" << p.x << ", " << p.y << ")\n";
    }
    // std::cout << "생성된 경로:\n";
    // for (const Point& p : path) {
    //     std::cout << p.x << "\t" << p.y << "\n";
    // }

    return 0;
}
