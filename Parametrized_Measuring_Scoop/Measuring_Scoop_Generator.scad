/*************************************************************************************
 *
 * $RCSfile: Measuring\040Scoop\040Generator.scad,v $
 * $Date: 2014/06/01 02:07:43 $
 * $Revision: 1.1 $
 *
 * Measuring Scoop Generator
 *
 *************************************************************************************
 *
 * THE FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHOR OR COPYRIGHT
 * HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * IT IS NOT PERMITTED TO MODIFY THIS COMMENT BLOCK.
 *
 * (c)2014, Claude "Tryphon" Theroux, Montreal, Quebec, Canada
 *
 ************************************************************************************/

////////////////////////////////////////////////////////////////////////////////
//
// Configuration parameters.
//

// Volume of the scoop in milliliters.
volume = 237;

// Tickness of the scoop in millimeters.
thickness = 2;

// Length of the handle in millimeters.  Minimum handleWidth + thickness * 4
handleLength = 50;

// Tickness of the handle in millimeters.
handleTickness = 5;

// Width of the handle in millimeters.  Minimum hangingHoleDistance * 2 + 2 mm.
handleWidth = 20;

// Distance between the side of the handle and the hanging hole in millimeters.
hangingHoleDistance = 3;

////////////////////////////////////////////////////////////////////////////////
//
// There is no configurable parameters below this line.
//

// PI
PI=3.14159265;

// Internal scoop radius
internalRadius = pow(volume * 2 * 3 / (4 * PI), 0.33333333333333) * 10;

// External scoop radius
externalRadius = internalRadius + thickness;

// Tickness of the scoop in millimeters.
hangingHoleRadius = (handleWidth - (hangingHoleDistance * 2)) / 2;

module scoop() {
	difference() {
		difference() {
			sphere(externalRadius, $fn=150);
			sphere(internalRadius, $fn=150);
		}
		translate([0, 0, -externalRadius]) 
			cube([externalRadius * 3, externalRadius * 3, externalRadius * 2], center = true);
	}
}

module handle() {
	difference() {
		union() {
			#cube([handleLength - handleWidth, handleWidth, handleTickness], center = true);
			cube([handleLength - handleWidth - hangingHoleRadius, 
					handleTickness, 
					handleTickness * 2], center = true);
			translate([(handleLength - handleWidth) / 2, 0, 0]) 
				cylinder(h = handleTickness, r = handleWidth / 2, center = true, $fn=50);
		}
		// handle hole
		translate([(handleLength - handleWidth) / 2, 0, -handleTickness]) 
			cylinder(h = handleTickness * 2, r = hangingHoleRadius, $fn=50);
	}
}

scoop();
translate([internalRadius + (handleLength - handleWidth) / 2, 0, handleTickness / 2]) handle();

