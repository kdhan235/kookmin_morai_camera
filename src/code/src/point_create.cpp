#include <iostream>
#include <vector>

struct Point {
    double x, y;

    Point(double x, double y) : x(x), y(y) {}
};

std::vector<Point> createPath(const Point& start, const Point& end, int numPoints) {
    std::vector<Point> path;
    path.push_back(start);

    double deltaX = (end.x - start.x) / (numPoints + 1);
    double deltaY = (end.y - start.y) / (numPoints + 1);

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

    // 원하는 만큼의 중간 점을 생성합니다.
    int numPoints;
    std::cout << "원하는 만큼의 중간 점 수를 입력하세요: ";
    std::cin >> numPoints;

    std::vector<Point> path = createPath(start, end, numPoints);

    // 생성된 경로를 출력합니다.
    std::cout << "생성된 경로:\n";
    for (const Point& p : path) {
        std::cout << p.x << "\t" << p.y << "\n";
    }

    return 0;
}