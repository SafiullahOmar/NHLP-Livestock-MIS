<%@ Page Title="" Language="C#" MasterPageFile="~/OuterSiteMaster2.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPageTitle" runat="Server">
    Dasboard
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentDescription" runat="Server">
    Overiew & Statistics
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="Server">
    <script src="HChart/jquery.maphilight.min.js"></script>
    <div class="card border-bottom-green box-shadow-3 border-top-green border-top-2 border-bottom-3">
        <div class="row">
            <div class="col-md-12">
                <div class="card-block">

                    <div class="form-group">
                        <label for="ddlYear">Year to display relevant data and statistics</label>
                        <select class="form-control  " id="ddlYear">
                            <option value="2019">2019</option>
                            <option value="2018">2018</option>
                            <option value="2017">2017</option>
                            <option value="2016">2016</option>

                        </select>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <div class="card border-bottom-green box-shadow-3 border-top-green border-top-3 border-bottom-2">
        <div class="row">
            <div class="col-md-9 ">
                <div class="card-block">
                    <p><code>Click on a Province to display relevant data for the selected year on modal pop up.</code></p>
                    <img id="map" src="HChart/imagemap3.jpg" usemap="#Mp" />
                    <map name="Mp" id="Mp">
                        <area id="22" alt="Nimroz" href="#" title="Nimroz" shape="poly" coords="143, 323, 142, 330, 134, 334, 124, 334, 116, 332, 109, 331, 99, 334, 90, 335, 84, 338, 79, 341, 78, 345, 75, 349, 68, 354, 62, 355, 65, 359, 63, 364, 61, 367, 68, 368, 70, 375, 71, 379, 73, 384, 71, 393, 67, 400, 57, 410, 41, 429, 25, 447, 48, 454, 73, 462, 96, 470, 106, 471, 113, 470, 120, 468, 118, 447, 117, 435, 116, 429, 120, 423, 122, 416, 123, 410, 125, 408, 126, 401, 129, 396, 134, 392, 145, 384, 148, 375, 150, 367, 153, 359, 156, 353, 156, 348, 159, 344, 162, 340, 164, 334, 164, 329, 164, 325" />
                        <area id="23" title="Hilamand" href="#" alt="Hilamand" shape="poly" coords="163, 324, 167, 326, 164, 331, 165, 335, 160, 343, 157, 350, 155, 357, 153, 364, 149, 368, 148, 375, 146, 381, 142, 387, 133, 394, 126, 401, 126, 406, 122, 413, 122, 421, 116, 429, 116, 435, 117, 446, 118, 456, 119, 465, 120, 469, 138, 468, 150, 467, 165, 467, 182, 469, 189, 472, 191, 467, 201, 464, 208, 462, 220, 462, 221, 375, 225, 374, 220, 367, 218, 355, 216, 351, 220, 351, 222, 345, 222, 340, 226, 334, 234, 336, 241, 339, 245, 337, 239, 335, 232, 333, 235, 327, 239, 323, 244, 320, 246, 314, 249, 310, 249, 305, 244, 301, 246, 296, 243, 290, 245, 285, 250, 280, 252, 277, 253, 270, 261, 271, 265, 270, 268, 268, 265, 263, 266, 255, 268, 253, 263, 249, 258, 250, 256, 258, 250, 260, 248, 264, 242, 265, 233, 269, 228, 271, 223, 272, 217, 271, 214, 270, 210, 274, 205, 275, 199, 276, 197, 281, 202, 285, 201, 290, 201, 295, 196, 299, 191, 300, 184, 307, 181, 307, 180, 314, 171, 319, 165, 319" />
                        <area id="24" title="Kandahar" href="#" alt="Kandahar" shape="poly" coords="221, 387, 220, 461, 229, 462, 239, 464, 245, 462, 263, 456, 291, 448, 300, 445, 302, 439, 296, 436, 300, 428, 302, 414, 299, 410, 304, 396, 308, 392, 316, 388, 322, 378, 335, 372, 335, 377, 344, 377, 353, 379, 364, 374, 374, 370, 370, 366, 365, 365, 357, 364, 356, 358, 354, 352, 349, 349, 343, 347, 337, 344, 329, 346, 323, 346, 320, 348, 320, 338, 314, 344, 308, 347, 298, 349, 293, 344, 299, 340, 302, 335, 300, 330, 299, 323, 304, 321, 307, 317, 308, 313, 308, 308, 301, 308, 298, 310, 290, 309, 284, 310, 277, 310, 272, 310, 265, 310, 252, 312, 247, 312, 246, 317, 247, 320, 242, 323, 234, 326, 232, 331, 238, 335, 244, 337, 242, 340, 234, 335, 229, 338, 226, 334, 222, 344, 220, 351, 217, 352, 219, 358, 219, 363, 222, 369, 224, 372, 220, 376" />
                        <area id="21" title="Farah" href="#" alt="Farah" shape="poly" coords="13, 288, 44, 288, 44, 296, 49, 294, 54, 292, 62, 292, 65, 289, 70, 290, 78, 285, 84, 290, 93, 287, 96, 291, 102, 289, 106, 283, 112, 282, 117, 278, 129, 278, 136, 273, 140, 265, 133, 261, 142, 259, 147, 260, 148, 264, 160, 266, 165, 261, 170, 263, 176, 258, 180, 255, 188, 255, 183, 261, 188, 267, 192, 272, 198, 273, 199, 276, 197, 281, 201, 286, 201, 290, 201, 294, 197, 297, 190, 302, 184, 307, 182, 308, 182, 313, 176, 315, 170, 319, 166, 320, 164, 324, 148, 325, 142, 322, 142, 331, 134, 333, 121, 334, 112, 332, 104, 333, 93, 335, 87, 335, 79, 340, 78, 346, 69, 354, 64, 357, 65, 362, 62, 366, 55, 367, 36, 365, 27, 363, 20, 355, 20, 341, 25, 329, 19, 305" />
                        <area id="20" title="Hirat" href="#" alt="Hirat" shape="poly" coords="13, 288, 44, 288, 44, 297, 49, 296, 52, 291, 62, 292, 64, 289, 72, 290, 77, 284, 82, 290, 92, 287, 96, 289, 96, 292, 103, 288, 106, 284, 112, 282, 119, 278, 130, 277, 135, 275, 136, 270, 140, 266, 134, 261, 138, 258, 145, 259, 148, 255, 145, 252, 152, 252, 157, 252, 161, 251, 160, 247, 163, 243, 160, 238, 157, 234, 153, 231, 157, 226, 149, 223, 153, 217, 158, 219, 164, 219, 171, 219, 182, 220, 187, 217, 189, 212, 187, 207, 192, 200, 185, 203, 177, 205, 170, 205, 161, 204, 156, 201, 148, 199, 140, 199, 131, 200, 131, 203, 122, 200, 122, 195, 119, 189, 115, 184, 118, 177, 123, 174, 122, 169, 113, 172, 105, 169, 98, 177, 96, 168, 86, 163, 81, 158, 70, 163, 59, 160, 49, 150, 44, 151, 42, 162, 34, 171, 36, 178, 35, 186, 34, 191, 29, 200, 24, 207, 19, 209, 26, 217, 15, 220, 8, 224, 7, 231, 8, 239, 7, 245, 7, 251, 14, 257, 24, 258, 23, 262, 15, 271, 8, 278" />
                        <area id="19" title="Badghis" href="#" alt="Badghis" shape="poly" coords="121, 168, 122, 175, 117, 180, 115, 185, 120, 188, 123, 194, 123, 202, 131, 204, 135, 198, 143, 201, 155, 201, 164, 206, 169, 205, 180, 205, 188, 201, 192, 200, 196, 203, 203, 201, 208, 203, 211, 196, 218, 193, 221, 186, 221, 182, 229, 181, 228, 178, 222, 177, 222, 170, 216, 174, 208, 174, 204, 172, 199, 161, 193, 158, 182, 157, 183, 146, 176, 145, 176, 131, 161, 135, 155, 138, 136, 139, 145, 148, 138, 152, 137, 161" />
                        <area id="27" title="Ghor" href="#" alt="Ghor" shape="poly" coords="182, 221, 169, 217, 156, 219, 150, 220, 147, 224, 155, 225, 157, 229, 151, 230, 158, 236, 162, 243, 160, 247, 161, 252, 151, 252, 147, 256, 148, 263, 154, 265, 162, 265, 163, 261, 168, 262, 176, 258, 183, 255, 187, 255, 184, 262, 189, 271, 196, 273, 199, 275, 210, 274, 213, 271, 220, 271, 225, 272, 241, 266, 247, 263, 249, 260, 257, 258, 259, 251, 263, 247, 256, 242, 256, 238, 260, 232, 267, 227, 261, 226, 263, 221, 265, 215, 275, 215, 284, 217, 287, 214, 296, 218, 300, 215, 306, 217, 310, 216, 310, 212, 314, 207, 319, 205, 320, 200, 310, 200, 307, 194, 308, 188, 303, 185, 292, 187, 288, 181, 287, 177, 285, 172, 279, 170, 273, 169, 266, 167, 260, 168, 255, 170, 251, 174, 246, 170, 237, 168, 229, 168, 221, 168, 221, 175, 222, 178, 229, 179, 223, 183, 220, 186, 218, 191, 216, 194, 211, 197, 208, 202, 203, 202, 193, 203, 188, 205, 186, 208, 188, 213, 186, 218" />
                        <area id="34" title="Diakundi" href="#" alt="Diakundi" shape="poly" coords="312, 232, 317, 234, 326, 231, 334, 239, 335, 241, 338, 236, 346, 235, 353, 237, 356, 243, 351, 247, 353, 250, 343, 249, 337, 252, 329, 254, 328, 258, 327, 263, 327, 266, 319, 268, 311, 273, 310, 279, 305, 277, 298, 277, 289, 280, 283, 282, 277, 278, 267, 278, 259, 278, 252, 278, 252, 270, 254, 268, 263, 272, 268, 269, 266, 263, 265, 258, 266, 252, 262, 250, 263, 247, 258, 243, 254, 241, 259, 235, 262, 230, 267, 225, 261, 225, 266, 220, 266, 215, 278, 214, 282, 216, 291, 214, 294, 217, 298, 216, 305, 216, 310, 216, 315, 217, 309, 224" />
                        <area id="26" title="Urozgan" href="#" alt="Urozgan" shape="poly" coords="248, 303, 247, 308, 250, 313, 260, 312, 269, 310, 278, 309, 286, 309, 297, 310, 300, 311, 304, 303, 312, 301, 316, 301, 319, 295, 329, 293, 330, 282, 336, 275, 334, 268, 329, 266, 321, 269, 314, 270, 311, 275, 310, 280, 306, 276, 302, 280, 298, 276, 289, 277, 283, 282, 278, 278, 267, 278, 259, 277, 253, 279, 247, 282, 245, 289, 245, 297" />
                        <area id="25" title="Zabul" href="#" alt="Zabul" shape="poly" coords="302, 307, 308, 309, 309, 314, 306, 319, 303, 323, 299, 325, 301, 331, 302, 336, 297, 342, 294, 344, 298, 350, 305, 347, 310, 347, 316, 343, 318, 339, 322, 345, 326, 347, 332, 344, 336, 343, 338, 348, 343, 348, 347, 352, 351, 350, 355, 354, 355, 359, 360, 363, 365, 365, 365, 360, 373, 363, 376, 357, 386, 355, 390, 349, 397, 347, 394, 338, 386, 332, 378, 328, 372, 324, 368, 321, 370, 316, 370, 313, 365, 310, 367, 304, 360, 302, 360, 295, 357, 292, 353, 289, 349, 284, 344, 283, 336, 283, 330, 283, 330, 290, 326, 293, 321, 295, 316, 299, 316, 304, 309, 300, 303, 301" />
                        <area id="29" title="Paktika" href="#" alt="Paktika" shape="poly" coords="398, 349, 405, 350, 414, 353, 416, 348, 425, 357, 430, 358, 437, 355, 444, 348, 451, 340, 449, 327, 449, 320, 448, 311, 453, 308, 458, 303, 457, 298, 462, 292, 462, 284, 454, 280, 454, 271, 449, 267, 436, 277, 434, 272, 431, 266, 431, 263, 425, 263, 416, 268, 415, 275, 408, 280, 407, 288, 402, 292, 395, 290, 394, 297, 388, 298, 382, 297, 378, 302, 386, 308, 388, 312, 390, 319, 388, 324, 388, 330, 387, 333, 393, 342" />
                        <area id="6" title="Ghazni" href="#" alt="Ghazni" shape="poly" coords="389, 315, 389, 322, 389, 327, 387, 333, 378, 329, 374, 324, 367, 321, 370, 316, 370, 312, 364, 309, 367, 304, 362, 302, 358, 293, 352, 290, 349, 285, 345, 285, 342, 281, 337, 285, 330, 284, 333, 277, 336, 274, 334, 269, 328, 265, 327, 262, 328, 256, 332, 251, 339, 250, 343, 248, 350, 250, 350, 247, 353, 243, 354, 236, 346, 235, 347, 229, 354, 226, 360, 225, 365, 222, 370, 227, 378, 227, 387, 223, 391, 223, 392, 229, 394, 234, 400, 236, 395, 242, 399, 251, 405, 246, 409, 248, 417, 250, 421, 246, 427, 249, 424, 253, 426, 259, 426, 264, 420, 265, 416, 268, 417, 273, 411, 278, 408, 281, 408, 286, 402, 291, 397, 291, 393, 296, 386, 300, 383, 295, 379, 302, 386, 309" />
                        <area id="18" title="Faryab" href="#" alt="Faryab" shape="poly" coords="215, 102, 215, 109, 209, 118, 199, 122, 188, 124, 182, 131, 177, 132, 177, 141, 175, 144, 182, 148, 182, 157, 191, 157, 198, 161, 203, 168, 206, 175, 217, 174, 221, 168, 227, 168, 235, 169, 240, 168, 247, 169, 251, 172, 256, 168, 265, 168, 256, 162, 253, 158, 257, 155, 258, 147, 255, 143, 266, 142, 267, 138, 269, 131, 260, 129, 258, 136, 252, 135, 248, 131, 243, 134, 243, 127, 244, 121, 247, 116, 247, 111, 258, 111, 258, 103, 256, 98, 259, 93, 259, 86, 256, 82, 256, 67, 248, 68, 240, 68, 228, 71, 220, 75, 223, 82, 222, 90, 216, 95" />
                        <area id="31" title="Saripul" href="#" alt="Saripul" shape="poly" coords="254, 159, 262, 165, 267, 170, 274, 170, 279, 172, 287, 172, 288, 181, 292, 190, 298, 186, 305, 186, 302, 178, 300, 171, 308, 171, 319, 166, 327, 162, 335, 157, 335, 145, 325, 146, 318, 146, 311, 147, 316, 138, 315, 131, 320, 126, 309, 122, 307, 115, 300, 111, 304, 108, 290, 106, 279, 106, 267, 107, 261, 112, 259, 120, 261, 127, 263, 132, 268, 132, 265, 139, 264, 143, 255, 144, 259, 150" />
                        <area id="28" title="Bamyan" href="#" alt="Bamyan" shape="poly" coords="310, 222, 310, 229, 315, 234, 324, 231, 332, 234, 334, 240, 339, 235, 348, 235, 349, 228, 355, 226, 353, 222, 357, 218, 354, 215, 357, 211, 349, 212, 346, 210, 350, 205, 350, 200, 355, 197, 361, 200, 369, 201, 379, 201, 387, 204, 391, 197, 395, 194, 398, 191, 398, 185, 396, 181, 387, 178, 387, 170, 391, 167, 391, 161, 384, 160, 373, 160, 363, 158, 357, 160, 349, 160, 342, 161, 334, 163, 328, 161, 322, 164, 314, 170, 306, 172, 299, 172, 300, 176, 304, 180, 304, 186, 309, 190, 308, 196, 314, 201, 320, 200, 318, 204, 315, 207, 313, 210, 308, 215, 314, 217" />
                        <area id="4" title="Wardak" href="#" alt="Wardak" shape="poly" coords="387, 204, 380, 199, 370, 199, 358, 199, 351, 199, 348, 203, 349, 207, 349, 211, 355, 211, 354, 215, 356, 217, 355, 222, 355, 227, 363, 226, 365, 221, 372, 228, 376, 225, 382, 225, 389, 221, 392, 227, 392, 233, 396, 234, 399, 236, 394, 242, 398, 248, 401, 250, 404, 247, 407, 248, 415, 248, 420, 245, 425, 242, 425, 238, 429, 232, 427, 227, 427, 222, 432, 220, 436, 213, 430, 211, 429, 205, 429, 200, 423, 199, 413, 198, 405, 199, 400, 193, 396, 193" />
                        <area id="5" title="Logar" href="#" alt="Logar" shape="poly" coords="433, 217, 430, 223, 427, 227, 429, 234, 425, 239, 424, 243, 421, 244, 428, 249, 425, 254, 432, 253, 437, 248, 444, 245, 454, 240, 459, 234, 463, 230, 471, 231, 477, 228, 475, 221, 468, 221, 463, 221, 455, 223, 452, 215, 443, 217, 437, 214" />
                        <area id="7" title="Paktiya" href="#" alt="Paktiya" shape="poly" coords="452, 240, 445, 245, 441, 247, 435, 252, 425, 252, 424, 257, 427, 262, 432, 264, 432, 268, 435, 273, 439, 276, 446, 270, 448, 267, 455, 271, 462, 264, 464, 260, 459, 258, 463, 252, 464, 247, 474, 255, 477, 257, 480, 252, 483, 254, 483, 250, 485, 247, 482, 242, 479, 237, 483, 232, 477, 227, 470, 233, 466, 229, 460, 233" />
                        <area id="32" title="Khost" href="#" alt="Khost" shape="poly" coords="461, 283, 466, 281, 474, 281, 479, 281, 487, 280, 490, 276, 495, 276, 501, 269, 501, 264, 497, 259, 496, 252, 492, 247, 485, 247, 484, 251, 483, 254, 480, 254, 478, 259, 471, 252, 465, 248, 461, 257, 464, 261, 460, 267, 455, 273, 454, 281" />
                        <area id="17" title="Jazjan" href="#" alt="Jazjan" shape="poly" coords="255, 70, 255, 82, 258, 89, 258, 95, 255, 98, 259, 107, 259, 111, 249, 113, 246, 118, 244, 123, 243, 131, 243, 134, 248, 132, 251, 134, 258, 135, 262, 130, 264, 126, 259, 123, 260, 116, 263, 110, 271, 109, 282, 106, 295, 107, 301, 106, 305, 108, 307, 106, 306, 100, 305, 93, 310, 91, 313, 90, 309, 83, 306, 80, 306, 75, 304, 71, 296, 70, 296, 62, 290, 57, 276, 53, 269, 54, 266, 62, 261, 68" />
                        <area id="16" title="Balkh" href="#" alt="Balkh" shape="poly" coords="315, 135, 316, 141, 312, 146, 319, 146, 325, 147, 329, 146, 334, 146, 334, 143, 341, 143, 337, 137, 336, 132, 338, 131, 338, 126, 346, 124, 352, 122, 357, 124, 355, 117, 358, 113, 360, 107, 359, 101, 367, 100, 377, 103, 384, 100, 390, 102, 394, 100, 389, 91, 388, 83, 380, 78, 375, 71, 367, 67, 358, 67, 349, 70, 345, 66, 339, 62, 332, 59, 325, 63, 311, 62, 295, 62, 297, 69, 304, 72, 306, 79, 310, 85, 314, 88, 311, 93, 305, 92, 304, 96, 305, 102, 308, 107, 302, 109, 303, 113, 308, 119, 311, 123, 320, 127, 315, 130" />
                        <area id="15" title="Samangan" href="#" alt="Samangan" shape="poly" coords="329, 162, 334, 163, 345, 160, 355, 160, 364, 158, 382, 160, 391, 156, 395, 151, 392, 146, 399, 142, 402, 138, 403, 129, 410, 126, 412, 122, 412, 114, 411, 107, 411, 101, 402, 104, 395, 101, 389, 103, 381, 99, 377, 102, 368, 100, 358, 100, 362, 106, 360, 113, 356, 117, 356, 123, 346, 123, 339, 126, 338, 132, 337, 134, 340, 140, 340, 143, 334, 143, 335, 148, 335, 154" />
                        <area id="13" title="Baghlan" href="#" alt="Baghlan" shape="poly" coords="413, 121, 409, 128, 402, 133, 402, 140, 395, 145, 392, 146, 395, 152, 391, 157, 385, 160, 391, 162, 390, 169, 386, 175, 387, 180, 395, 182, 401, 177, 411, 178, 420, 176, 423, 172, 430, 167, 438, 167, 442, 162, 451, 161, 460, 159, 470, 156, 476, 150, 477, 145, 483, 141, 487, 137, 481, 131, 476, 125, 474, 118, 471, 113, 461, 116, 454, 119, 444, 115, 441, 111, 441, 107, 437, 103, 433, 109, 427, 109, 419, 107, 412, 102, 411, 113" />
                        <area id="3" title="Parwan" href="#" alt="Parwan" shape="poly" coords="423, 172, 423, 172, 416, 176, 411, 179, 404, 179, 399, 179, 396, 182, 400, 188, 400, 193, 407, 200, 416, 198, 424, 200, 429, 200, 430, 193, 433, 186, 436, 183, 445, 188, 453, 186, 453, 192, 456, 197, 458, 203, 466, 199, 465, 189, 464, 185, 457, 186, 455, 185, 450, 180, 451, 175, 449, 170, 454, 167, 454, 163, 452, 160, 444, 162, 439, 164, 434, 167, 427, 167, 422, 172, 420, 171" />
                        <area id="2" title="Kapisa" href="#" alt="Kapisa" shape="poly" coords="451, 180, 451, 180, 459, 186, 464, 185, 464, 189, 465, 194, 466, 199, 472, 199, 477, 193, 481, 191, 485, 187, 481, 184, 479, 180, 474, 176, 468, 173, 462, 174, 452, 174, 450, 177, 450, 181, 450, 180" />
                        <area id="9" title="Laghman" href="#" alt="Laghman" shape="poly" coords="480, 201, 480, 201, 485, 204, 480, 207, 484, 210, 492, 210, 501, 209, 507, 206, 512, 205, 515, 203, 512, 196, 516, 191, 519, 187, 519, 183, 511, 188, 504, 186, 496, 187, 495, 180, 488, 177, 481, 177, 478, 180, 484, 185, 483, 190, 481, 195, 479, 200" />
                        <area id="8" title="Nangarhar" href="#" alt="Nangarhar" shape="poly" coords="483, 211, 483, 211, 475, 211, 469, 215, 463, 223, 473, 220, 478, 228, 485, 234, 495, 236, 513, 237, 531, 237, 537, 234, 541, 229, 544, 222, 544, 215, 538, 210, 540, 205, 528, 205, 522, 202, 520, 196, 519, 189, 512, 196, 515, 203, 509, 208, 500, 210, 490, 211, 482, 210, 483, 212" />
                        <area id="1" title="Kabul" href="#" alt="Kabul" shape="poly" coords="437, 183, 437, 183, 443, 187, 451, 187, 454, 187, 454, 194, 458, 199, 458, 203, 462, 201, 467, 200, 472, 199, 476, 194, 483, 190, 481, 196, 480, 201, 486, 204, 480, 207, 482, 212, 472, 212, 466, 218, 460, 222, 455, 220, 450, 215, 440, 216, 433, 213, 428, 206, 430, 199, 432, 193, 436, 182" />
                        <area id="33" title="Panjsher" href="#" alt="Panjsher" shape="poly" coords="495, 137, 495, 137, 488, 137, 484, 139, 482, 145, 477, 146, 476, 152, 470, 157, 463, 158, 455, 160, 455, 166, 449, 169, 452, 173, 458, 175, 467, 174, 474, 174, 480, 180, 485, 173, 487, 167, 484, 162, 490, 159, 495, 153, 499, 147, 500, 141, 497, 136, 493, 136" />
                        <area id="30" title="Nuristan" href="#" alt="Nuristan" shape="poly" coords="511, 187, 511, 187, 503, 185, 497, 187, 497, 181, 490, 177, 481, 177, 485, 169, 484, 161, 489, 158, 497, 153, 499, 148, 505, 146, 511, 148, 515, 154, 512, 161, 513, 167, 517, 159, 524, 158, 530, 156, 533, 150, 537, 145, 540, 137, 544, 132, 550, 132, 558, 137, 563, 144, 566, 148, 566, 154, 571, 160, 565, 167, 561, 173, 554, 167, 548, 168, 545, 173, 544, 179, 536, 178, 532, 182, 526, 179, 522, 184, 516, 186, 511, 186" />
                        <area id="10" title="Kunar" href="#" alt="Kunar" shape="poly" coords="543, 200, 543, 200, 552, 192, 558, 187, 564, 184, 565, 179, 570, 174, 568, 168, 562, 172, 557, 167, 547, 168, 545, 175, 545, 180, 537, 179, 529, 183, 526, 179, 519, 183, 518, 188, 520, 193, 521, 201, 524, 206, 534, 204, 540, 204, 542, 199" />
                        <area id="14" title="Kunduz" href="#" alt="Kunduz" shape="poly" coords="417, 69, 417, 69, 404, 74, 400, 77, 398, 81, 392, 81, 387, 84, 390, 93, 396, 101, 402, 103, 410, 101, 413, 105, 423, 107, 431, 110, 434, 105, 438, 107, 442, 109, 441, 113, 447, 111, 446, 106, 447, 100, 451, 100, 448, 95, 450, 89, 451, 85, 454, 80, 452, 74, 444, 73, 436, 67, 432, 63, 423, 66, 416, 68" />
                        <area id="12" title="Takhar" href="#" alt="Takhar" shape="poly" coords="451, 76, 451, 76, 455, 80, 454, 84, 450, 86, 449, 92, 448, 96, 449, 100, 445, 106, 444, 113, 451, 118, 458, 119, 465, 116, 469, 113, 473, 118, 476, 125, 479, 129, 485, 134, 489, 137, 496, 137, 502, 139, 508, 134, 509, 127, 509, 116, 495, 116, 494, 110, 492, 103, 487, 98, 487, 90, 488, 83, 493, 78, 490, 72, 488, 67, 488, 62, 485, 58, 488, 52, 479, 49, 469, 50, 460, 51, 456, 60, 456, 67, 456, 72, 450, 75" />
                        <area id="11" title="Badakhshan" href="#" alt="Badakhshan" shape="poly" coords="580, 97, 580, 97, 601, 83, 608, 81, 618, 79, 626, 73, 634, 67, 646, 62, 653, 57, 667, 57, 678, 59, 674, 65, 669, 68, 678, 69, 686, 66, 693, 64, 698, 63, 702, 59, 712, 60, 720, 61, 728, 63, 734, 69, 726, 68, 715, 70, 714, 77, 718, 81, 710, 84, 696, 87, 686, 88, 672, 86, 658, 88, 648, 87, 634, 89, 618, 90, 608, 95, 593, 101, 582, 107, 577, 112, 570, 110, 554, 125, 550, 131, 542, 134, 538, 141, 538, 149, 530, 154, 522, 159, 515, 162, 511, 164, 515, 153, 510, 147, 504, 147, 499, 149, 499, 141, 501, 137, 508, 133, 510, 125, 511, 119, 504, 117, 492, 115, 492, 109, 492, 101, 488, 95, 488, 85, 492, 79, 489, 71, 488, 64, 486, 58, 488, 52, 498, 52, 502, 45, 500, 39, 497, 35, 508, 25, 512, 19, 520, 11, 528, 6, 538, 5, 542, 7, 548, 12, 555, 16, 554, 34, 568, 34, 564, 46, 563, 59, 561, 68, 559, 75, 560, 83, 564, 91, 568, 97, 579, 97" />
                    </map>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card ml-0">
                    <div class="card-header">
                        <h4 class="card-title " id="list-fuzzy-search">Livestock Activities Details</h4>
                    </div>
                    <div class="card-body">
                        <div id="dvscroll" class="dvdashboard table-responsive" style="overflow: auto; position: relative; height: 480px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(function () {
            //$('#dvscroll').perfectScrollbar();
            $('#map').maphilight({ stroke: true, fillColor: '009DDF', fillOpacity: 0.1 });
            $('#ddlYear').val((new Date()).getFullYear());
            $('#ddlYear').change(function () {
                //$.fn.CallItemGInfo();
                $.fn.CallMultiInfo();
            });

            $('#Mp area').click(function (e) {
                e.preventDefault();
                var proid = $(this).attr('id');
                var title = $(this).attr('title');
                if (proid != '') {
                    $.ajax({
                        type: "post",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        url: "Dashboard.aspx/GetAnimalProduction",
                        data: '{proid:' + proid + ',year:' + $('#ddlYear').val() + '}',
                        success: function (data) {
                            $('#mdDetails').remove();
                            BuilModal();
                            if (data.d.AnimalPlst) {
                                $.each(data.d.AnimalPlst, function (i, x) {
                                    $('span.spPoultry30').text(x.Poultry30);
                                    $('span.spPoultry100').text(x.Poultry100);
                                    $('span.spPoultry500').text(x.Poultry500);
                                    $('span.spPoultry5000').text(x.Poultry5000);
                                    $('span.spFishery').text(x.Ponds);
                                    $('span.spPonds').text(x.Hatchry);
                                    $('span.sptotalProj').text(parseFloat(x.Poultry30) + parseFloat(x.Poultry100) + parseFloat(x.Poultry500) + parseFloat(x.Poultry5000) + parseFloat(x.Ponds) + parseFloat(x.Hatchry));
                                });
                            }
                            var totalExt = 0;
                            if (data.d.Extensionlst) {
                                $.each(data.d.Extensionlst, function (i, x) {
                                    $('span.spExtFemale').text(x.Female);
                                    $('span.spExtMale').text(x.Male);
                                    $('span.spMembers').text(x.Members);
                                    $('span.spExtTotal').text(parseFloat(x.Female) + parseFloat(x.Male));
                                });
                            }
                            var totalVac = 0;
                            if (data.d.AnimalHlst) {
                                $.each(data.d.AnimalHlst, function (i, x) {
                                    $('span.spRev').text(x.REV1);
                                    $('span.spSV').text(x.S19);
                                    $('span.sptotalVac').text(parseFloat(x.REV1) + parseFloat(x.S19));
                                });
                            }
                            $('#mdDetails').modal('show');

                        },
                        failure: function () { alert('some thing goes wrong'); }
                    });
                }

            });

            $.fn.CallMultiInfo = function () {
                $.ajax({
                    type: "POST",
                    url: "Dashboard.aspx/GetActivityInfo",
                    data: '{year:' + $('#ddlYear').val() + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        Ponds = []; province = []; Hry = []; P30 = []; P100 = []; P500 = []; P5000 = [];
                        var arr = new Array();
                        if (data.d) {
                            $('table.table ').remove();
                            var $table = "<table class='table mb-0'>";
                            $('table.table tr').remove();
                           // $table += "<thead><tr class=' bg-green bg-lighten-3 text-bold-400 font-medium-1'><td>Activity</td><td>Benefeciaries</td></tr></thead>";
                            $table += "<tbody>";
                            var activity; var total = 0;
                            var row1 = 1, row2 = 1, row3 = 1, row4 = 1;
                            $.each(data.d, function (i, x) {
                                if (x.Activity == "S19")
                                    activity = "S19 Vaccination";
                                else if (x.Activity == "REV1")
                                    activity = "REV 1 Vaccination";
                                else if (x.Activity == "Male")
                                    activity = "VFU";
                                else if (x.Activity == "Female")
                                    activity = "EFA";
                                else if (x.Activity == "mem")
                                    activity = "VFU/EFA Members";

                                else
                                    activity = x.Activity;
                                total += x.Number;
                                
                                if (x.rowId < 99 && row1==1) {
                                    $table += "<tr class=' bg-green bg-lighten-3 text-bold-400 font-medium-1' ><td colspan='2'>Animal Production</td></tr>";
                                    row1=0;
                                }
                                if (x.rowId < 199 && x.rowId > 99 && row2 == 1) {
                                    $table += "<tr class=' bg-green bg-lighten-3 text-bold-400 font-medium-1' ><td colspan='2'>Animal Health</td></tr>";
                                    row2=0;
                                }
                                if (x.rowId < 299 && x.rowId > 199 && row3 == 1) {
                                    $table += "<tr class=' bg-green bg-lighten-3 text-bold-400 font-medium-1' ><td colspan='2'>Extension</td></tr>";
                                    row3=0;
                                }
                                if (x.rowId < 399 && x.rowId > 299 && row4 == 1) {
                                    $table += "<tr class=' bg-green bg-lighten-3 text-bold-400 font-medium-1' ><td colspan='2'>Extension Input Packages</td></tr>";
                                    row4=0;
                                }
                                $table += "<tr class=' bg-lighten-5'><td>" + activity + "</td><td class='text-bold-700 font-small-5'><span class='tag tag-glow tag-pill  bg-green bg-lighten-3 bg-accent-1 ml-1 black'> " + x.Number + "</span></td></tr>";
                                //ul += "<div class='sales-today mb-2'>"+
                                //            "<p class='m-0'>" + activity + " <span class='text-bold-800 sucess float-xs-right'><i class=''></i> " + x.Number + "</span></p>" +
                                //            "<progress class='progress progress-sm progress-success progress-accent-3 mb-0' value='70' max='100'></progress>"+
                                //        "</div>";
                                //ul +="</li>";
                            });

                            //ul += "</ul>";
                            $table += "<tr class=' bg-green bg-lighten-3 text-bold-400 font-medium-1'><td>Total Livestock Benefeciaries</td><td><span class='tag tag-glow tag-pill bg-green bg-lighten-3 bg-accent-1 ml-1'>" + total + "</span></td></tr>";
                            $table += "</tbody></table>";

                            //$('#dvdashboard').html(ul);
                            $('.dvdashboard').append($table);
                        }
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
            $.fn.CallMultiInfo();

        });
        function BuilModal() {
            $('<div>', {
                'class': 'modal fade text-xs-left',
                'Id': 'mdDetails',
                'role': 'dialog',
                'aria-labelledby': 'myModalLabel4',
                'aria-hidden': 'true',
                'html': $('<div>', {
                    'class': 'modal-dialog modal-lg',
                    'role': 'document',
                    'html': $('<div>', {
                        'class': 'modal-content',
                        'html': $('<div>', {
                            'class': 'modal-header bg-green bg-lighten-3', 'html': $('<button>', {
                                'class': 'close', 'data-dismiss': 'modal', 'aria-label': 'Close'
                            }).add($('<h4>', { 'class': 'modal-title text-bold-700 text-uppercase  ', 'text': 'Livestock Benefeciaries Detail Report' }))

                        }).add($('<div>', {
                            'class': 'modal-body',
                            'html': $('<div>', {
                                'class': 'form-body',
                                'html': $('<div>', {
                                    'class': 'row',
                                    html: $('<div>', {
                                        'class': 'col-md-4',
                                        html: 'Animal Production',
                                        html: $('<ul>', {
                                            'class': 'list-group list',
                                            html: $('<li>', {
                                                'class': 'list-group-item bg-green bg-lighten-3',
                                                html: $('<span>', {
                                                    'text': 'Animal Production ',
                                                    'class': 'text-bold-800 text-uppercase'
                                                })
                                            }).add($('<li>', {
                                                'class': 'list-group-item',
                                                html: $('<span>', {
                                                    'text': ' Improved Backyard PP',
                                                    'class': 'icon-arrow-right-b'
                                                }).add($('<span>', { 'class': 'spPoultry100 float-md-right text-bold-600 text-uppercase font-medium-2' }))
                                            }))
                                                .add($('<li>', {
                                                    'class': 'list-group-item',
                                                    html: $('<span>', {
                                                        'text': ' Small Scale Commercial PP',
                                                        'class': 'icon-arrow-right-b'
                                                    }).add($('<span>', { 'class': 'spPoultry100 float-md-right text-bold-600 text-uppercase font-medium-2' }))
                                                })).add($('<li>', {
                                                    'class': 'list-group-item',
                                                    html: $('<span>', {
                                                        'text': ' Semi Commercial PP',
                                                        'class': 'icon-arrow-right-b'
                                                    }).add($('<span>', { 'class': 'spPoultry500 float-md-right text-bold-600 text-uppercase font-medium-2' }))
                                                })).add($('<li>', {
                                                    'class': 'list-group-item',
                                                    html: $('<span>', {
                                                        'text': ' Commercial PP',
                                                        'class': 'icon-arrow-right-b'
                                                    }).add($('<span>', { 'class': 'spPoultry5000 float-md-right text-bold-600 text-uppercase font-medium-2' }))
                                                })).add($('<li>', {
                                                    'class': 'list-group-item',
                                                    html: $('<span>', {
                                                        'text': '  Hatchry Fishery P',
                                                        'class': 'icon-arrow-right-b'
                                                    }).add($('<span>', { 'class': 'spFishery float-md-right text-bold-600 text-uppercase font-medium-2' }))
                                                })).add($('<li>', {
                                                    'class': 'list-group-item',
                                                    html: $('<span>', {
                                                        'text': ' Fishery Ponds P',
                                                        'class': 'icon-arrow-right-b'
                                                    }).add($('<span>', { 'class': 'spPonds float-md-right text-bold-600 text-uppercase font-medium-2' }))
                                                }))
                                            .add($('<li>', {
                                                'class': 'list-group-item bg-green bg-lighten-3',
                                                html: $('<span>', {
                                                    'text': 'Total Benefeciaries',
                                                    'class': ' text-bold-600'
                                                }).add($('<span>', { 'class': 'sptotalProj float-md-right text-bold-900 text-uppercase font-medium-2' }))
                                            }))
                                        })

                                    }).add($('<div>', {
                                        'class': 'col-md-4',
                                        html: $('<ul>', {
                                            'class': 'list-group list',
                                            html: $('<li>', {
                                                'class': 'list-group-item bg-green bg-lighten-3',
                                                html: $('<span>', {
                                                    'text': 'Extension Workers',
                                                    'class': 'text-bold-800 text-uppercase'
                                                })
                                            })
                                              .add($('<li>', {
                                                  'class': 'list-group-item',
                                                  html: $('<span>', {
                                                      'text': 'Male Extension Workers',
                                                      'class': 'icon-arrow-right-b'
                                                  }).add($('<span>', { 'text': ' ', 'class': 'spExtMale float-md-right text-bold-600 text-uppercase font-medium-2' }))
                                              })).
                                                add($('<li>', {
                                                    'class': 'list-group-item',
                                                    html: $('<span>', {
                                                        'text': 'Female Extension Workers',
                                                        'class': 'icon-arrow-right-b'
                                                    }).add($('<span>', { 'text': ' ', 'class': 'spExtFemale float-md-right text-bold-600 text-uppercase font-medium-2' }))
                                                })).add($('<li>', {
                                                    'class': 'list-group-item',
                                                    html: $('<span>', {
                                                        'text': 'Livestock Members',
                                                        'class': 'icon-arrow-right-b'
                                                    }).add($('<span>', { 'text': ' ', 'class': 'spMembers float-md-right text-bold-600 text-uppercase font-medium-2' }))
                                                }))
                                        })

                                    }))
                                    .add($('<div>', {
                                        'class': 'col-md-4',
                                        html: $('<ul>', {
                                            'class': 'list-group list',
                                            html: $('<li>', {
                                                'class': 'list-group-item bg-green bg-lighten-3',
                                                html: $('<span>', {
                                                    'text': 'Animal Health',
                                                    'class': 'text-bold-800 text-uppercase'
                                                })
                                            }).add($('<li>', {
                                                'class': 'list-group-item',
                                                html: $('<span>', {
                                                    'text': 'S19 Vaccination',
                                                    'class': 'icon-arrow-right-b'
                                                }).add($('<span>', { 'text': ' ', 'class': 'spRev float-md-right text-bold-600 text-uppercase font-medium-2' }))
                                            }))
                                              .add($('<li>', {
                                                  'class': 'list-group-item',
                                                  html: $('<span>', {
                                                      'text': 'S19 Vaccination',
                                                      'class': 'icon-arrow-right-b'
                                                  }).add($('<span>', { 'text': ' ', 'class': 'spSV float-md-right text-bold-600 text-uppercase font-medium-2' }))
                                              }))
                                            .add($('<li>', {
                                                'class': 'list-group-item  bg-green bg-lighten-3',
                                                html: $('<span>', {
                                                    'text': 'T Vaccination Benefeciaries',
                                                    'class': ' text-bold-600'
                                                }).add($('<span>', { 'text': ' ', 'class': 'sptotalVac float-md-right text-bold-600 text-uppercase font-medium-2' }))
                                            }))
                                        })

                                    }))

                                })

                            })
                              .add($('<div>', {
                                  'class': 'modal-footer',
                                  'html': $('<button>', {
                                      'class': 'btn grey btn-outline-secondary',
                                      'data-dismiss': 'modal',
                                      'text': 'Close',
                                      'Id': 'btnClose'
                                  })
                              }))

                        })
                    )
                    })
                })
            }).appendTo('body');
        }
    </script>
</asp:Content>

