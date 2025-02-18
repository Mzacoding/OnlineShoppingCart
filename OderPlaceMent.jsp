
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Oder Placement</title>
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet">

        <style>
            
            *{
                padding:0;
                margin:0;
                box-sizing: border-box;
            }
            

          
            .formSession{
                position: absolute;
                top:50%;
                left:50%;
                transform: translate(-50%,-50%);
                padding:1rem;
                border:2px solid red; 
                font-family: "Josefin Sans", serif;
            }
            
            .OderBtn{
                padding :0.5rem;
                margin-top: 2rem;
                border-radius: 0.3rem;
                width:93%;
                border:none;
                box-shadow: 2px 2px 2px rgba(0,0,0,0.4);
                cursor: pointer;
                font-weight: 600;
                background-color: rgb(170,250,180);
                transition: 0.5s;
            }
            .OderBtn:hover{
                background-color: rgb(90,240,100);
                transition: 0.5s;
            }
            table{
                //padding: 1rem;
                 
            }
            input,select{
                padding:0.3rem;
                margin-left: 1rem;
            }
            select{
                width:92%;
            }
        </style>
        
    </head>
    <body>

        <div class="formSession">



            <table>

                <tr>

                    <td><label>Full Name :</label></td>
                    <td><input type="text" name="fname"></td>
                </tr>

                <tr>

                    <td><label>email address :</label></td>
                    <td><input type="email" name="email"></td>
                </tr>
                <tr>

                    <td><label>Whats App Number :</label></td>
                    <td><input type="tel" name="AppNo"></td>
                </tr>

                <tr>

                    <td><label>Building Name :</label></td>
                    <td>
                        <select name="buildingName">

                            <option value="Nicola">
                                Nicola
                            </option>

                            <option value="Lineria">
                                Lineria 
                            </option>

                            <option value="Gardenia">
                                Gardenia 
                            </option>

                            <option value="Lisandria">
                                Lisandria 
                            </option>

                            <option value="Nicola New Rooms">
                                Nicola New Rooms 
                            </option>

                            <option value="Lineria  New Rooms">
                                Lineria  New Rooms
                            </option>
                            <option value="GL New Rooms">
                                GL New Rooms
                            </option>


                        </select>


                    </td>
                </tr>

                <tr>

                    <td><label>Floor no:</label></td>
                    <td><input type="number" name="floorNo"></td>
                </tr>

                <tr>

                    <td><label>Unit no :</label></td>
                    <td><input type="number" name="unitNo"></td>
                </tr>

                <tr>

                    <td><label>Room no:</label></td>
                    <td><input type="number" name="roomNo"></td>
                </tr>

                <tr>

                    <td><label></label></td>
                    <td><input type="submit" name="btn"  class="OderBtn" value="Place Order"></td>
                </tr>

            </table>


        </div>

    </body>
</html>
