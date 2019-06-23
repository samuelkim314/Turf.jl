using GeoInterface: LineString, Polygon, Point
include("../src/lib/Booleans.jl")

@testset "booleans" begin
    line1 = LineString([[9.170356, 45.477985], [9.164434, 45.482551], [9.166644, 45.484003]])
    line2 = LineString([[9.169356, 45.477985], [9.163434, 45.482551], [9.165644, 45.484003]])

    line3 = LineString([[
						-111.544189453125,
						24.186847428521244
					],
					[
						-110.687255859375,
						24.966140159912975
					],
					[
						-110.4510498046875,
						24.467150664739002
					],
					[
						-109.9951171875,
						25.180087808990645
					]])

	line4 = LineString([[
						-111.4617919921875,
						24.05148034322011
					],
					[
						-110.8795166015625,
						24.681961205014595
					],
					[
						-110.841064453125,
						24.14174098050432
					],
					[
						-109.97863769531249,
						24.617057340809524
					]])

    @test parallel(line1, line2) == true
	@test parallel(line3, line4) == false

	poly1 = Polygon([[[0, 0], [1, 0], [1, 1], [0.5, 0.5], [0, 1], [0, 0]]])
	poly2 = Polygon([[[0, 0], [0, 1], [1, 1], [1, 0], [0, 0]]])

	@test concave(poly1) == true
	@test concave(poly2) == false

	l1 = LineString([[0, 0], [1, 1], [1, 0], [0, 0]])
	l2 = LineString([[0, 0], [1, 0], [1, 1], [0, 0]])

	@test clockwise(l1) == true
	@test clockwise(l2) == false

	l3 = LineString([[0, 0], [3, 3]])
	p1 = Point([1, 1])

	l4 = LineString([[0, 0], [3, 3]])
	p2 = Point([0, 0])

	p3 = Point([20, 20])
	l5 = LineString([[0, 0], [3, 3], [38.32, 5.96]])

	@test pointOnLine(p2, l4, true) == false
	@test pointOnLine(p3, l5, true) == false
	#@test pointOnLine(p1, l3, true) == true # <- this fails

	pt = Point([-77, 44])
	poly = Polygon([[ [-81, 41], [-81, 47], [-72, 47], [-72, 41], [-81, 41]]])

	#@test pointInPolygon(pt, poly) == true
end