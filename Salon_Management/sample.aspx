<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sample.aspx.cs" Inherits="Salon_Management.sample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* Custom styling for the camera-shaped button */
        .camera-upload-container {
            display: inline-block;
            position: relative;
            width: 50px;
            height: 50px;
            border: 3px solid #333;
            cursor: pointer;
            overflow: hidden;
        }

        .camera-icon {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 40px;
            color: #333;
        }

        /* Hide the default FileUpload control */
        #fileUpload {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Camera Shaped FileUpload</h1>
            <label class="camera-upload-container">
                <asp:FileUpload ID="fileUpload" runat="server" onchange="handleFileSelect(event)" accept="image/*" />
                <div class="camera-icon">&#x1F4F7;</div>
            </label>
            <br />
            <img id="uploadedImage" src="" style="display: none;" />
            <span id="lblMessage" style="color: red;"></span>
        </div>
    </form>

    
</body>
</html>
