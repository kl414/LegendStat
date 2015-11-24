/*!
*
* \author VaHiD AzIzI
*
*/


#include "obstacles/GJK_EPA.h"

SteerLib::GJK_EPA::GJK_EPA()
{
}   
    //calculating the Perp (a x b) x c
    Util::Vector calcPerp(Util::Vector a, Util::Vector b, Util::Vector c){
        return (b * (c * a) - a * (c * b));
    }

    //find the findFarthest point on given shape
    Util::Vector findFarthest(const std::vector<Util::Vector> _shape,Util::Vector d){
        
        Util::Vector v = _shape[0];
        float max = _shape[0] * d;

        for(Util::Vector point:_shape){
            float dotProduct = point * d;
            if(dotProduct > max){
                max = dotProduct;
                v = point;
            }
        }
        return v;
    }

    //return the point on simplex after Minkowski difference
    Util::Vector support(const std::vector<Util::Vector> _shapeA, const std::vector<Util::Vector> _shapeB, Util::Vector direction){
        Util::Vector p1 = findFarthest(_shapeA, direction);
        Util::Vector p2 = findFarthest(_shapeB, -direction);
        Util::Vector p3 = p1 - p2;
        /*
        std::cout << "p1      p2      p3";
        std::cout << "\n";
        std::cout << p1;
        std::cout << p2;
        std::cout << p3;
        std::cout << "\n\n";
        */
        return p3;
    }
    
    //check if the last point past origin
    bool checkLast(Util::Vector point, Util::Vector d){
        return (point * d >= 0);
    }

    bool containOrigin(std::vector<Util::Vector>& simplex, Util::Vector& d){
        
        Util::Vector a = simplex[simplex.size() - 1];
        Util::Vector a0 = -a;

        //if simplex is a line, then it cannot contain the origin
        if(simplex.size() == 2){
            Util::Vector b = simplex[0];

            Util::Vector ab = b - a;

            Util::Vector abPerp = calcPerp(ab, a0, ab);

            d = abPerp;

        }else{
            
            Util::Vector c = simplex[1];
            Util::Vector b = simplex[0];

            Util::Vector ab = b - a;
            Util::Vector ac = c - a;

            Util::Vector abPerp = calcPerp(ac, ab, ab);
            Util::Vector acPerp = calcPerp(ab, ac, ac);

            if(abPerp * a0 > 0){
                //remove c
                simplex.erase(simplex.begin() + 1);

                d = abPerp;
            }else{
                
                if(acPerp * a0 > 0){
                
                    //remove b
                    simplex.erase(simplex.begin());

                    d = acPerp;
                }else{
                    return true;
                }
            }
        }

        return false;
    }
    bool GJK(const std::vector<Util::Vector> _shapeA, const std::vector<Util::Vector> _shapeB, std::vector<Util::Vector>& simplex){
        
        
        Util::Vector pointA;
        Util::Vector d = Util::Vector(1,0,0);
        pointA = support(_shapeA, _shapeB, d);
        d = -d;
        simplex.push_back(pointA);
        while(true){
            Util::Vector lastPoint;
            lastPoint = support(_shapeA, _shapeB, d);
            simplex.push_back(lastPoint);
            if(!checkLast(lastPoint, d)){
                simplex.clear();
                return false;
            }else{
                bool result = containOrigin(simplex, d);
                if(result){
                    return true;
                }else{
                    //if the origin lies on the line, then we still consider it as collision
                    if(d == 0){
                        return true;
                    }
                }
            }
        }
        /*
        if(checkLast(pointB, -d))
            std::cout << "true\n";
        else
            std::cout << "false\n";
        */


        //std::cout << newDirection(Util::Vector(4,0,2), Util::Vector(-8,0,-2));
        return false;
    }
//Look at the GJK_EPA.h header file for documentation and instructions
bool SteerLib::GJK_EPA::intersect(float& return_penetration_depth, Util::Vector& return_penetration_vector, const std::vector<Util::Vector>& _shapeA, const std::vector<Util::Vector>& _shapeB)
{
    
    std::vector<Util::Vector> simplex;
    /*
     * GJK will make simplex to empty if not collision
     * if there is a collision, three possible simplex may be returned
     * 1. normal 3 points simplex
     * 2. simplex with 2 points(a, b), where origin lies on the line ab(not including a, b) 
     * 3. simplex with 2 points(a, b), where origin is a or b
     *
     * PS. The polygons1.xml has a special situation that simplex is on the line ab (situation2)
     * so you guys need to consider the EPA for this too
     */
    bool result = GJK(_shapeA, _shapeB, simplex);
    
    //this is for checking simplex
    /*
     for(Util::Vector temp:simplex)
     std::cout << temp;
     std::cout << "-----------simplex\n\n";
     */
    return result;// There is no collision
}
