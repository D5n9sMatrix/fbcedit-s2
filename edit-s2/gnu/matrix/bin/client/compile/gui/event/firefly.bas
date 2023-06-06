		With This
			.Name = "Form3"
			.Text = "Form3"
			.FormStyle = FormStyles.fsNormal
			#ifdef __USE_GTK__
				This.Icon.LoadFromFile(ExePath & "VisualFBEditor.ico")
			#else
				This.Icon.LoadFromResourceID(1)
			#endif
			.Designer = @This
			.OnClick = @_Form_Click
			.Menu = @MainMenuForm3
			.SetBounds 0, 0, 350, 319
		End With